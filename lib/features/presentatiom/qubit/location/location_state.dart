// location_state.dart
import '../../../domain/entities/weather_forecast_entity.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final WeatherForecastEntity weatherForecast;
  LocationLoaded(this.weatherForecast);
}

class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}
