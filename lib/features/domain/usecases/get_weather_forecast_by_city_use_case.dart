import 'package:either_dart/either.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';

import '../../../core/error/failures.dart';
import '../repository/weather_repository.dart';

class GetWeatherForecastByCity {
  final WeatherRepository repository;

  GetWeatherForecastByCity(this.repository);

  Future<Either<Failure, WeatherForecastEntity>> execute(String city) async {
    try {
      final result = await repository.getWeatherForecastByCity(city);
      return result.fold(
        (failure) => Left(failure),
        (dto) => Right(WeatherForecastEntity.fromDTO(dto)),
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
