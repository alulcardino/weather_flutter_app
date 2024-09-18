import 'package:weather_flutter_app/core/error/exceptions.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';
import 'package:weather_flutter_app/features/domain/repository/weather_repository.dart';

class GetWeatherForecastByLocation {
  final WeatherRepository repository;

  GetWeatherForecastByLocation(this.repository);

  Future<WeatherForecastEntity> call() async {
    try {
      final weather = await repository.getWeatherForecastByLocation();
      return WeatherForecastEntity.fromDTO(weather);
    } catch (e) {
      if (e is Failure) {
        rethrow;
      } else {
        throw UnknownFailure('An unknown error occurred');
      }
    }
  }
}
