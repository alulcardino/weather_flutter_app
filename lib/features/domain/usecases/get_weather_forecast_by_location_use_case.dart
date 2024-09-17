import 'package:either_dart/either.dart';

import '../../../core/error/failures.dart';
import '../entities/weather_forecast_entity.dart';
import '../repository/weather_repository.dart';

class GetWeatherForecastByLocation {
  final WeatherRepository repository;

  GetWeatherForecastByLocation(this.repository);

  Future<Either<Failure, WeatherForecastEntity>> execute() async {
    try {
      final result = await repository.getWeatherForecastByLocation();
      return result.fold(
        (failure) => Left(failure),
        (dto) => Right(WeatherForecastEntity.fromDTO(dto)),
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
