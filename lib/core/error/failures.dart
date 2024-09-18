// ignore_for_file: use_super_parameters

class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class ServerException extends AppException {
  ServerException(String message) : super(message);
}

class NetworkException extends AppException {
  NetworkException(String message) : super(message);
}

class UnknownException extends AppException {
  UnknownException(String message) : super(message);
}