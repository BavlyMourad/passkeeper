sealed class AppException implements Exception {}

class WrongPinException extends AppException {}

class BiometricAuthException extends AppException {}

class BiometricNotEnrolledException extends AppException {}
