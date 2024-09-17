import 'package:dio/dio.dart';
import 'package:typed_json/typed_json.dart';
import 'package:weather_flutter_app/features/data/dto/weather_forecast_dto.dart';
import '../../../core/error/exceptions.dart';
import '../../presentatiom/utils/constants.dart';
import '../../presentatiom/utils/location.dart';

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

    final response = await dio.get(
      Constants.WEATHER_FORECAST_PATH,
      queryParameters: parameters,
    );

    if (response.statusCode == 200) {
      return WeatherForecastDTO.fromJson(Json(response.data));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<WeatherForecastDTO> getWeatherForecastByLocation() async {
    await location.getCurrentLocation(); // Use injected Location
    final parameters = {
      'appid': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
    };

    final response = await dio.get(
      Constants.WEATHER_FORECAST_PATH,
      queryParameters: parameters,
    );

    if (response.statusCode == 200) {
      return WeatherForecastDTO.fromJson(Json(response.data));
    } else {
      throw ServerException();
    }
  }
}
