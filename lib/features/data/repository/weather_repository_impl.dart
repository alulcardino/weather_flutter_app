import 'package:either_dart/either.dart';
import 'package:weather_flutter_app/features/data/dto/weather_forecast_dto.dart';

import '../../../core/error/failures.dart';
import '../../domain/repository/weather_repository.dart';
import '../datasources/weather_remote_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, WeatherForecastDTO>> getWeatherForecastByCity(
      String city) async {
    try {
      final weather = await remoteDataSource.getWeatherForecastByCity(city);
      print(
          'Weather data for city $city: $weather'); // Логирование успешного результата
      return Right(weather);
    } catch (e) {
      print(
          'Failed to get weather data for city $city: $e'); // Логирование ошибки
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, WeatherForecastDTO>>
      getWeatherForecastByLocation() async {
    try {
      final weather = await remoteDataSource.getWeatherForecastByLocation();
      print(
          'Weather data by location: $weather'); // Логирование успешного результата
      return Right(weather);
    } catch (e) {
      print('Failed to get weather data by location: $e'); // Логирование ошибки
      return Left(ServerFailure());
    }
  }
}
