import '../../../domain/entities/weather_forecast_entity.dart';

abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String cityName;

  FetchWeather(this.cityName);
}

class FetchWeatherByLocation extends WeatherEvent {
  final WeatherForecastEntity locationWeather;

  FetchWeatherByLocation(this.locationWeather);
}
