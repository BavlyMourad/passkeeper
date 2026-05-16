sealed class AppException implements Exception {}

class PinMismatchException extends AppException {}

class PinTooShortException extends AppException {}
