import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:weather_flutter_app/features/data/adapters/force_double_adapter.dart';
import 'package:weather_flutter_app/features/data/datasources/weather_remote_data_source.dart';
import 'package:weather_flutter_app/features/data/repository/weather_repository_impl.dart';
import 'package:weather_flutter_app/features/domain/repository/weather_repository.dart';
import 'package:weather_flutter_app/features/domain/usecases/get_weather_forecast_by_city_use_case.dart';
import 'package:weather_flutter_app/features/domain/usecases/get_weather_forecast_by_location_use_case.dart';
import 'package:weather_flutter_app/features/presentation/qubit/location/location_cubit.dart';
import 'package:weather_flutter_app/features/presentation/qubit/weather/weather_cubit.dart';
import 'package:weather_flutter_app/features/presentation/utils/constants.dart';
import 'package:weather_flutter_app/features/presentation/utils/location.dart';


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

    container.registerFactory<LocationCubit>(
      (c) => LocationCubit(c.resolve<GetWeatherForecastByLocation>()),
    );

    container.registerFactory<WeatherCubit>(
      (c) => WeatherCubit(
        getWeatherByCity: c.resolve<GetWeatherForecastByCity>(),
        getWeatherByLocation: c.resolve<GetWeatherForecastByLocation>(),
      ),
    );

    container.registerFactory<ForceDoubleJsonAdapter>(
      (c) => ForceDoubleJsonAdapter(),
    );
  }
}
