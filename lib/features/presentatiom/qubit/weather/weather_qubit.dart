import 'package:bloc/bloc.dart';
import 'package:weather_flutter_app/features/domain/usecases/get_weather_forecast_by_city_use_case.dart';
import 'package:weather_flutter_app/features/presentatiom/qubit/weather/weather_event.dart';
import 'package:weather_flutter_app/features/presentatiom/qubit/weather/weather_state.dart';

import '../../../domain/usecases/get_weather_forecast_by_location_use_case.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherForecastByCity getWeatherByCity;
  final GetWeatherForecastByLocation getWeatherByLocation;

  WeatherBloc({
    required this.getWeatherByCity,
    required this.getWeatherByLocation,
  }) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final result = await getWeatherByCity.execute(event.cityName);
        emit(result.fold(
          (failure) => WeatherError("Failed to load weather data for city."),
          (weatherForecast) => WeatherLoaded(weatherForecast),
        ));
      } catch (e) {
        emit(WeatherError("An unexpected error occurred."));
      }
    });

    on<FetchWeatherByLocation>((event, emit) async {
      emit(WeatherLoading());
      try {
        final result = await getWeatherByLocation.execute();
        emit(result.fold(
          (failure) => WeatherError("Failed to load weather data by location."),
          (weatherForecast) => WeatherLoaded(weatherForecast),
        ));
      } catch (e) {
        emit(WeatherError("An unexpected error occurred."));
      }
    });
  }
}
