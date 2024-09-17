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
      return Right(weather);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, WeatherForecastDTO>>
      getWeatherForecastByLocation() async {
    try {
      final weather = await remoteDataSource.getWeatherForecastByLocation();
      return Right(weather);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
