import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';

abstract class LocationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoadInProgress extends LocationState {}

class LocationLoadSuccess extends LocationState {
  final WeatherForecastEntity weatherForecast;
  LocationLoadSuccess(this.weatherForecast);

  @override
  List<Object> get props => [weatherForecast];
}

class LocationLoadingFailure extends LocationState {
  final String message;
  LocationLoadingFailure(this.message);

  @override
  List<Object> get props => [message];
}