  import 'package:dio/dio.dart';
  import 'package:typed_json/typed_json.dart';
  import 'package:weather_flutter_app/core/error/exceptions.dart';
  import 'package:weather_flutter_app/core/error/failures.dart';
  import 'package:weather_flutter_app/features/data/dto/weather_forecast_dto.dart';
  import 'package:weather_flutter_app/features/presentation/utils/constants.dart';
  import 'package:weather_flutter_app/features/presentation/utils/location.dart';

 abstract class WeatherRemoteDataSource {
  Future<WeatherForecastDTO> getWeatherForecastByCity(String city);
  Future<WeatherForecastDTO> getWeatherForecastByLocation();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;
  final Location location;

  WeatherRemoteDataSourceImpl(this.dio, this.location);

  @override
  Future<WeatherForecastDTO> getWeatherForecastByCity(String city) async {
    final parameters = {
      'appid': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': city,
    };

    print('WeatherRemoteDataSourceImpl: Fetching weather forecast for city: $city with parameters: $parameters');

    try {
      final response = await dio.get(
        Constants.WEATHER_FORECAST_PATH,
        queryParameters: parameters,
      );

      if (response.statusCode == 200) {
        print('WeatherRemoteDataSourceImpl: Successfully fetched weather data for city');
        return WeatherForecastDTO.fromJson(Json(response.data));
      } else {
        print('WeatherRemoteDataSourceImpl: Failed to fetch weather data for city with status code: ${response.statusCode}');
        throw ServerException('Failed to fetch weather data for city.');
      }
    } catch (e) {
      print('WeatherRemoteDataSourceImpl: Exception encountered - $e');
      throw ServerException('Failed to fetch weather data for city.');
    }
  }

  @override
  Future<WeatherForecastDTO> getWeatherForecastByLocation() async {
    await location.getCurrentLocation();
    final parameters = {
      'appid': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
    };

    print('WeatherRemoteDataSourceImpl: Fetching weather forecast for current location with parameters: $parameters');

    try {
      final response = await dio.get(
        Constants.WEATHER_FORECAST_PATH,
        queryParameters: parameters,
      );

      if (response.statusCode == 200) {
        print('WeatherRemoteDataSourceImpl: Successfully fetched weather data for current location');
        return WeatherForecastDTO.fromJson(Json(response.data));
      } else {
        print('WeatherRemoteDataSourceImpl: Failed to fetch weather data for current location with status code: ${response.statusCode}');
        throw ServerException('Failed to fetch weather data for current location.');
      }
    } catch (e) {
      print('WeatherRemoteDataSourceImpl: Exception encountered - $e');
      throw ServerException('Failed to fetch weather data for current location.');
    }
  }
}