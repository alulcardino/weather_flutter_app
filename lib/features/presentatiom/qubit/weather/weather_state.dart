import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherForecastEntity weatherForecast;

  WeatherLoaded(this.weatherForecast);

  @override
  List<Object?> get props => [weatherForecast];
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}
