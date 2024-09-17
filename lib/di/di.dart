import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import '../../features/data/datasources/weather_remote_data_source.dart';
import '../features/data/repository/weather_repository_impl.dart';
import '../features/domain/repository/weather_repository.dart';
import '../features/domain/usecases/get_weather_forecast_by_city_use_case.dart';
import '../features/domain/usecases/get_weather_forecast_by_location_use_case.dart';
import '../features/presentatiom/qubit/location/location_qubit.dart';
import '../features/presentatiom/qubit/weather/weather_qubit.dart';
import '../utils/constants.dart';
import '../utils/location.dart';

class DependencyInjection {
  static final KiwiContainer container = KiwiContainer();

  static void setup() {
    container.registerFactory<Dio>(
      (c) => Dio(
        BaseOptions(
          baseUrl:
              Constants.WEATHER_BASE_SCHEME + Constants.WEATHER_BASE_URL_DOMAIN,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ),
    );

    container.registerFactory<WeatherRemoteDataSource>(
      (c) =>
          WeatherRemoteDataSourceImpl(c.resolve<Dio>(), c.resolve<Location>()),
    );

    container.registerFactory<WeatherRepository>(
      (c) => WeatherRepositoryImpl(c.resolve<WeatherRemoteDataSource>()),
    );

    container.registerFactory<GetWeatherForecastByCity>(
      (c) => GetWeatherForecastByCity(c.resolve<WeatherRepository>()),
    );

    container.registerFactory<GetWeatherForecastByLocation>(
      (c) => GetWeatherForecastByLocation(c.resolve<WeatherRepository>()),
    );

    container.registerFactory<Location>(
      (c) => Location(),
    );

    // Register BLoCs
    container.registerFactory<LocationBloc>(
      (c) => LocationBloc(c.resolve<GetWeatherForecastByLocation>()),
    );

    container.registerFactory<WeatherBloc>(
      (c) => WeatherBloc(
        getWeatherByCity: c.resolve<GetWeatherForecastByCity>(),
        getWeatherByLocation: c.resolve<GetWeatherForecastByLocation>(),
      ),
    );
  }
}
