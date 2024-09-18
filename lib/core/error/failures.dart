class AppException implements Exception {
  final String message;
  AppException(this.message);
}

// Исключение для серверных ошибок
class ServerException extends AppException {
  ServerException(String message) : super(message);
}

// Исключение для сетевых ошибок
class NetworkException extends AppException {
  NetworkException(String message) : super(message);
}

// Исключение для других неизвестных ошибок
class UnknownException extends AppException {
  UnknownException(String message) : super(message);
}