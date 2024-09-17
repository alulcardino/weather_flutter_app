import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_entity.dart';

import '../../presentatiom/utils/constants.dart';
import '../../data/dto/weather_list_dto.dart';
import 'temp_entity.dart';

class WeatherListEntity extends Equatable {
  final int dt;
  final TempEntity temp;
  final int pressure;
  final int humidity;
  final List<WeatherEntity> weather;
  final double speed;
  final int deg;
  final int clouds;

  const WeatherListEntity({
    required this.dt,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.clouds,
  });

  WeatherListEntity.fromDTO(WeatherListDTO dto)
      : dt = dto.dt,
        temp = TempEntity.fromDTO(dto.temp),
        pressure = dto.pressure,
        humidity = dto.humidity,
        weather = dto.weather.map((e) => WeatherEntity.fromDTO(e)).toList(),
        speed = dto.speed,
        deg = dto.deg,
        clouds = dto.clouds;

  @override
  List<Object?> get props =>
      [dt, temp, pressure, humidity, weather, speed, deg, clouds];

  String getIconUrl() {
    return '${Constants.WEATHER_IMAGES_URL}${weather[0].icon}.png';
  }
}
