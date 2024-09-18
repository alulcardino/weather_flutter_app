import 'package:bloc/bloc.dart';
import 'package:weather_flutter_app/features/domain/usecases/get_weather_forecast_by_city_use_case.dart';
import 'package:weather_flutter_app/features/domain/usecases/get_weather_forecast_by_location_use_case.dart';
import 'package:weather_flutter_app/features/presentation/error_handler.dart';
import 'package:weather_flutter_app/features/presentation/qubit/weather/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherForecastByCity getWeatherByCity;
  final GetWeatherForecastByLocation getWeatherByLocation;

  WeatherCubit({
    required this.getWeatherByCity,
    required this.getWeatherByLocation,
  }) : super(WeatherInitial());

  void fetchWeather(String cityName) async {
    emit(WeatherLoadInProgress());
    try {
      final weatherForecast = await getWeatherByCity(cityName);
      emit(WeatherLoadSuccess(weatherForecast));
    } catch (e) {
      final failure = ErrorHandler.handleError(e);
      emit(WeatherLoadFailure(
          failure.message)); 
    }
  }

  void fetchWeatherByLocation() async {
    emit(WeatherLoadInProgress());
    try {
      final weatherForecast = await getWeatherByLocation();
      emit(WeatherLoadSuccess(weatherForecast));
    } catch (e) {
      final failure = ErrorHandler.handleError(e);
      emit(WeatherLoadFailure(
          failure.message)); 
    }
  }
}
