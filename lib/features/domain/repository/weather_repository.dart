import 'package:weather_flutter_app/features/data/dto/weather_forecast_dto.dart';

abstract class WeatherRepository {
  Future<WeatherForecastDTO> getWeatherForecastByCity(String city);
  Future<WeatherForecastDTO> getWeatherForecastByLocation();
}
