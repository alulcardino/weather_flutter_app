// location_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/features/domain/usecases/get_weather_forecast_by_location_use_case.dart';
import 'package:weather_flutter_app/features/presentation/error_handler.dart';
import 'package:weather_flutter_app/features/presentation/qubit/location/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetWeatherForecastByLocation getWeatherForecast;

  LocationCubit(this.getWeatherForecast) : super(LocationInitial()) {
  }

  Future<void> loadLocationData() async {
    emit(LocationLoadInProgress());
    try {
      final weatherForecast = await getWeatherForecast();
      emit(LocationLoadSuccess(weatherForecast));
    } catch (e) {
      final failure = ErrorHandler.handleError(e);
      emit(LocationLoadingFailure(failure.message));
    }
  }
}
