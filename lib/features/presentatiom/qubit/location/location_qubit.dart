// location_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/features/domain/usecases/get_weather_forecast_by_location_use_case.dart';
import 'package:weather_flutter_app/features/presentatiom/qubit/location/location_event.dart';
import 'package:weather_flutter_app/features/presentatiom/qubit/location/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetWeatherForecastByLocation getWeatherForecast;

  LocationBloc(this.getWeatherForecast) : super(LocationInitial()) {
    on<LoadLocationData>((event, emit) async {
      emit(LocationLoading());
      try {
        final result = await getWeatherForecast.execute();
        result.fold(
          (failure) =>
              emit(LocationError("Failed to load weather data by location.")),
          (weatherForecast) => emit(LocationLoaded(weatherForecast)),
        );
      } catch (e) {
        emit(LocationError("An unexpected error occurred."));
      }
    });
  }
}
