import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final WeatherForecastEntity weatherForecast;
  WeatherLoadSuccess(this.weatherForecast);

  @override
  List<Object> get props => [weatherForecast];
}

class WeatherLoadFailure extends WeatherState {
  final String message;
  WeatherLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
