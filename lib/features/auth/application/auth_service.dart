import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:local_auth/local_auth.dart';
import 'package:passkeeper/config/l10n/app_language_notifier.dart';
import 'package:passkeeper/core/constants/crypto_constants.dart';
import 'package:passkeeper/core/data/secure_storage_repository.dart';
import 'package:passkeeper/core/errors/app_exception.dart';
import 'package:passkeeper/core/providers/biometric_auth.dart';
import 'package:passkeeper/core/providers/mek_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref);
}

class AuthService {
  AuthService(this._ref);

  final Ref _ref;

  // ------- Private Helpers -------

  // uses OS CSPRNG directly — cryptographically secure
  Uint8List _generateRandomBytes(int length) {
    final random = Random.secure();
    return Uint8List.fromList(
      List.generate(length, (_) => random.nextInt(256)),
    );
  }

  // derives a 32-byte KEK from PIN + salt using Argon2id
  // pin.trim() ensures no accidental whitespace inconsistency
  Future<Uint8List> _deriveKek(String pin, Uint8List salt) async {
    final argon2 = Argon2id(
      memory: CryptoConstants.memory,
      iterations: CryptoConstants.iterations,
      parallelism: CryptoConstants.parallelism,
      hashLength: CryptoConstants.hashLength,
    );

    final secretKey = await argon2.deriveKey(
      secretKey: SecretKey(utf8.encode(pin.trim())),
      nonce: salt,
    );

    return Uint8List.fromList(await secretKey.extractBytes());
  }

  // encrypts MEK with KEK using AES-256-GCM
  // returns base64(nonce + ciphertext + mac)
  Future<String> _encryptMek(Uint8List mek, Uint8List kek) async {
    final algorithm = AesGcm.with256bits();
    final secretKey = await algorithm.newSecretKeyFromBytes(kek);

    // let the library generate the nonce securely
    final secretBox = await algorithm.encrypt(mek, secretKey: secretKey);

    final combined = [
      ...secretBox.nonce, // nonce
      ...secretBox.cipherText, // ciphertext
      ...secretBox.mac.bytes, // mac tag
    ];

    return base64.encode(combined);
  }

  // decrypts encryptedMek with KEK using AES-256-GCM
  // throws SecretBoxAuthenticationError if mac fails → wrong PIN
  Future<Uint8List> _decryptMek(String encryptedMek, Uint8List kek) async {
    final algorithm = AesGcm.with256bits();
    final secretKey = await algorithm.newSecretKeyFromBytes(kek);
    final bytes = base64.decode(encryptedMek);

    // split back into nonce + ciphertext + mac
    final nonce = bytes.sublist(0, CryptoConstants.ivLength);
    final mac = bytes.sublist(bytes.length - 16);
    final cipherText = bytes.sublist(
      CryptoConstants.ivLength,
      bytes.length - 16,
    );

    final secretBox = SecretBox(cipherText, nonce: nonce, mac: Mac(mac));

    final decrypted = await algorithm.decrypt(secretBox, secretKey: secretKey);

    return Uint8List.fromList(decrypted);
  }

  // ------- Public Interface -------

  // checks if user has completed first time setup
  // both must exist — partial state treated as first time (corrupted/incomplete setup)
  Future<bool> isFirstTime() async {
    final storage = _ref.read(secureStorageRepositoryProvider);
    final encryptedMek = await storage.read(CryptoConstants.encryptedMekKey);
    final salt = await storage.read(CryptoConstants.argon2SaltKey);
    return encryptedMek == null || salt == null;
  }

  Future<void> setupPin(String pin) async {
    final biometricEnabled = _ref.read(biometricAuthProvider);
    final storage = _ref.read(secureStorageRepositoryProvider);
    final mekNotifier = _ref.read(mekProvider.notifier);

    // 1) Generate random salt
    final salt = _generateRandomBytes(CryptoConstants.saltLength);

    // 2) Derive KEK from PIN + salt via Argon2id
    final kek = await _deriveKek(pin, salt);

    // 3) Generate random MEK
    final mek = _generateRandomBytes(CryptoConstants.mekLength);

    // 4) Encrypt MEK with KEK via AES-256-GCM
    final encryptedMek = await _encryptMek(mek, kek);

    // 5) Store salt & encryptedMek in secure storage
    await storage.write(CryptoConstants.argon2SaltKey, base64.encode(salt));
    await storage.write(CryptoConstants.encryptedMekKey, encryptedMek);

    // 6) If biometric enabled, store KEK for fast biometric login
    if (biometricEnabled) {
      await storage.writeBiometric(
        CryptoConstants.kekBiometricKey,
        base64.encode(kek),
      );
    }

    // 7) Set MEK in memory - app is now unlocked
    mekNotifier.setMek(mek);

    // 8) Wipe sensitive keys from memory that is no longer needed after setup
    // MEK is not wiped, it lives in MekNotifier intentionally
    kek.fillRange(0, kek.length, 0);
    salt.fillRange(0, salt.length, 0);
  }

  Future<void> loginWithPin(String pin) async {
    final storage = _ref.read(secureStorageRepositoryProvider);
    final mekNotifier = _ref.read(mekProvider.notifier);

    // 1) load salt from secure storage
    final saltBase64 = await storage.read(CryptoConstants.argon2SaltKey);
    final salt = base64.decode(saltBase64!);

    // 2) derive KEK from PIN + salt — same Argon2id params = same KEK
    final kek = await _deriveKek(pin, salt);

    // 3) load encrypted MEK
    final encryptedMek = await storage.read(CryptoConstants.encryptedMekKey);

    try {
      // 4) decrypt MEK — throws SecretBoxAuthenticationError if wrong PIN
      final mek = await _decryptMek(encryptedMek!, kek);

      // 5) set MEK in memory — app unlocked
      mekNotifier.setMek(mek);

      // 6. wipe sensitive data
      kek.fillRange(0, kek.length, 0);
      salt.fillRange(0, salt.length, 0);
    } on SecretBoxAuthenticationError {
      kek.fillRange(0, kek.length, 0);
      salt.fillRange(0, salt.length, 0);

      throw WrongPinException();
    }
  }

  Future<void> loginWithBiometric() async {
    final storage = _ref.read(secureStorageRepositoryProvider);
    final mekNotifier = _ref.read(mekProvider.notifier);
    final localAuth = LocalAuthentication();

    final locale = _ref.read(appLanguageProvider).code;
    final localizedReason = locale == 'ar'
        ? 'قم بالمصادقة للوصول إلى PassKeeper'
        : 'Authenticate to access PassKeeper';

    // 1) prompt biometric — throws if failed/cancelled
    final authenticated = await localAuth.authenticate(
      localizedReason: localizedReason,
      sensitiveTransaction: true,
      biometricOnly: true,
    );

    if (!authenticated) throw BiometricAuthException();

    // 2) load KEK from secure storage — stored during setupPin
    final kekBase64 = await storage.readBiometric(
      CryptoConstants.kekBiometricKey,
    );
    if (kekBase64 == null) throw BiometricNotEnrolledException();

    final kek = base64.decode(kekBase64);

    // 3) load encrypted MEK
    final encryptedMek = await storage.read(CryptoConstants.encryptedMekKey);

    try {
      // 4) decrypt MEK with stored KEK — no Argon2id needed
      final mek = await _decryptMek(encryptedMek!, Uint8List.fromList(kek));

      // 5) set MEK in memory — app unlocked
      mekNotifier.setMek(mek);

      // 6) wipe KEK
      kek.fillRange(0, kek.length, 0);
    } on SecretBoxAuthenticationError {
      kek.fillRange(0, kek.length, 0);

      throw BiometricAuthException();
    }
  }
}
