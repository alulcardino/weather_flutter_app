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
    try {
      final result = await remoteDataSource.getWeatherForecastByCity(city);
      return result;
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    } catch (e) {
      throw UnknownFailure('An unknown error occurred');
    }
  }

  @override
  Future<WeatherForecastDTO> getWeatherForecastByLocation() async {
    try {
      final result = await remoteDataSource.getWeatherForecastByLocation();
      return result;
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    } catch (e) {
      throw UnknownFailure('An unknown error occurred');
    }
  }
}