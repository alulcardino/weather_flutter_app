import 'package:weather_flutter_app/core/error/exceptions.dart';
import 'package:weather_flutter_app/core/error/failures.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is ServerException) {
      return ServerFailure('Server error occurred: ${error.message}');
    } else if (error is NetworkException) {
      return NetworkFailure('Network error occurred: ${error.message}');
    } else if (error is Failure) {
      return error; 
    } else {
      return UnknownFailure('An unknown error occurred');
    }
  }
}