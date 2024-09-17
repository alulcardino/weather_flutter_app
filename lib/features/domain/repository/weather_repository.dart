import 'package:either_dart/either.dart';
import 'package:weather_flutter_app/features/data/dto/weather_forecast_dto.dart';
import '../../../core/error/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherForecastDTO>> getWeatherForecastByCity(
      String city);
  Future<Either<Failure, WeatherForecastDTO>> getWeatherForecastByLocation();
}
