import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/features/domain/entities/city_entity.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_list_entity.dart';

import '../../data/dto/weather_forecast_dto.dart';

class WeatherForecastEntity extends Equatable {
  final CityEntity city;
  final String cod;
  final double message;
  final int cnt;
  final List<WeatherListEntity>? list;

  const WeatherForecastEntity({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    this.list,
  });

  WeatherForecastEntity.fromDTO(WeatherForecastDTO dto)
      : city = CityEntity.fromDTO(dto.city),
        cod = dto.cod,
        message = dto.message,
        cnt = dto.cnt,
        list = dto.list?.map((e) => WeatherListEntity.fromDTO(e)).toList();

  @override
  List<Object?> get props => [city, cod, message, cnt, list];
}
