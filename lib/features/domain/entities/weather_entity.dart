import 'package:equatable/equatable.dart';

import '../../data/dto/weather_dto.dart';

class WeatherEntity extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  WeatherEntity.fromDTO(WeatherDTO dto)
      : id = dto.id,
        main = dto.main,
        description = dto.description,
        icon = dto.icon;

  @override
  List<Object?> get props => [id, main, description, icon];
}
