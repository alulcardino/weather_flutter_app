import 'package:weather_flutter_app/core/error/exceptions.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';
import 'package:weather_flutter_app/features/domain/repository/weather_repository.dart';

class GetWeatherForecastByCity {
  final WeatherRepository repository;

  GetWeatherForecastByCity(this.repository);

  Future<WeatherForecastEntity> call(String city) async {
    try {
      final weather = await repository.getWeatherForecastByCity(city);
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
