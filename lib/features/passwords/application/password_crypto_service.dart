import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:passkeeper/core/errors/app_exception.dart';
import 'package:passkeeper/core/providers/mek_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_crypto_service.g.dart';

@riverpod
PasswordCryptoService passwordCryptoService(Ref ref) {
  return PasswordCryptoService(ref);
}

class PasswordCryptoService {
  PasswordCryptoService(this._ref);

  final Ref _ref;

  Uint8List get _mek {
    final mek = _ref.read(mekProvider);
    if (mek == null) {
      throw SessionExpiredException();
    }
    return mek;
  }

  // Encrypts plainText, returning the ciphertext and its random IV
  // A fresh random IV per call ensures identical plaintexts never produce identical ciphertexts.
  Future<({String ciphertext, String iv})> encrypt(String plainText) async {
    final algorithm = AesGcm.with256bits();
    final secretKey = await algorithm.newSecretKeyFromBytes(_mek);

    final secretBox = await algorithm.encrypt(
      utf8.encode(plainText),
      secretKey: secretKey,
    );

    final combined = [...secretBox.cipherText, ...secretBox.mac.bytes];

    return (
      ciphertext: base64.encode(combined),
      iv: base64.encode(secretBox.nonce),
    );
  }

  // Decrypts ciphertext using the stored iv. Throws
  Future<String> decrypt({
    required String ciphertext,
    required String iv,
  }) async {
    final alogrithm = AesGcm.with256bits();
    final secretKey = await alogrithm.newSecretKeyFromBytes(_mek);

    final nonce = base64.decode(iv);
    final bytes = base64.decode(ciphertext);
    final mac = bytes.sublist(bytes.length - 16);
    final cipherText = bytes.sublist(0, bytes.length - 16);

    final secretBox = SecretBox(cipherText, nonce: nonce, mac: Mac(mac));
    final decrypted = await alogrithm.decrypt(secretBox, secretKey: secretKey);

    return utf8.decode(decrypted);
  }
}
