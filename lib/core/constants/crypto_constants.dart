class CryptoConstants {
  CryptoConstants._();

  // Secure Storage Keys
  static const String encryptedMekKey = 'encrypted_mek';
  static const String argon2SaltKey = 'argon2_salt';
  static const String kekBiometricKey = 'kek_biometric';

  // Argon2id Params
  static const int memory =
      65536; // 64MB RAM required per attempt -> GPU brute force very expensive
  static const int iterations =
      3; // Runs the algorithm 3 times -> slower per attempt
  static const int parallelism = 1; // Single thread
  static const int hashLength = 32; // KEK length

  // Length (bytes)
  static const int saltLength = 32;
  static const int mekLength = 32;
  static const int ivLength = 12; // AES-GCM IV
}
