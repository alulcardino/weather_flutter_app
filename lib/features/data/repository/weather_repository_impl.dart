import 'package:weather_flutter_app/core/error/exceptions.dart';
import 'package:weather_flutter_app/core/error/failures.dart';
import 'package:weather_flutter_app/features/data/datasources/weather_remote_data_source.dart';
import 'package:weather_flutter_app/features/data/dto/weather_forecast_dto.dart';
import 'package:weather_flutter_app/features/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<WeatherForecastDTO> getWeatherForecastByCity(String city) async {
    print('WeatherRepositoryImpl: Fetching weather forecast for city: $city');
    try {
      final result = await remoteDataSource.getWeatherForecastByCity(city);
      print('WeatherRepositoryImpl: Successfully fetched weather forecast for city');
      return result;
    } on ServerException catch (e) {
      print('WeatherRepositoryImpl: ServerException encountered - ${e.message}');
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      print('WeatherRepositoryImpl: NetworkException encountered - ${e.message}');
      throw NetworkFailure(e.message);
    } catch (e) {
      print('WeatherRepositoryImpl: Unknown error occurred');
      throw UnknownFailure('An unknown error occurred');
    }
  }

  @override
  Future<WeatherForecastDTO> getWeatherForecastByLocation() async {
    print('WeatherRepositoryImpl: Fetching weather forecast for current location');
    try {
      final result = await remoteDataSource.getWeatherForecastByLocation();
      print('WeatherRepositoryImpl: Successfully fetched weather forecast for current location');
      return result;
    } on ServerException catch (e) {
      print('WeatherRepositoryImpl: ServerException encountered - ${e.message}');
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      print('WeatherRepositoryImpl: NetworkException encountered - ${e.message}');
      throw NetworkFailure(e.message);
    } catch (e) {
      print('WeatherRepositoryImpl: Unknown error occurred');
      throw UnknownFailure('An unknown error occurred');
    }
  }
}