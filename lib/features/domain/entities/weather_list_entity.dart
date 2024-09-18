import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/features/data/dto/weather_list_dto.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_entity.dart';
import 'package:weather_flutter_app/features/presentation/utils/constants.dart';
import 'package:weather_flutter_app/features/domain/utils/formatter.dart';

class WeatherListEntity extends Equatable {
  final int dt;
  final String pressure;
  final String humidity;
  final String wind;
  final String temp;
  final List<WeatherEntity> weather;
  final int deg;
  final int clouds;
  final String icon;
  final String description;
  final String dayOfWeek;  

  const WeatherListEntity({
    required this.description,
    required this.dt,
    required this.icon,
    required this.pressure,
    required this.humidity,
    required this.wind,
    required this.temp,
    required this.weather,
    required this.deg,
    required this.clouds,
    required this.dayOfWeek, 
  });

  factory WeatherListEntity.fromDTO(WeatherListDTO dto) {
    final formattedPressure = Formatter.formatPressure(dto.pressure * 0.750062);
    final formattedHumidity = Formatter.formatHumidity(dto.humidity);
    final formattedWind = Formatter.formatWind(dto.speed);
    final formattedTempMin = Formatter.formatTemperature(dto.temp.min);
    final icon = '${Constants.WEATHER_IMAGES_URL}${dto.weather[0].icon}.png';
    final description = dto.weather[0].description;
    final formattedDate = DateTime.fromMillisecondsSinceEpoch(dto.dt * 1000);
    final dayOfWeek = Formatter.getDayOfWeek(Formatter.getFormattedDate(formattedDate));

    return WeatherListEntity(
      dt: dto.dt,
      pressure: formattedPressure,
      humidity: formattedHumidity,
      wind: formattedWind,
      temp: formattedTempMin,
      description: description,
      weather: dto.weather.map((e) => WeatherEntity.fromDTO(e)).toList(),
      deg: dto.deg,
      clouds: dto.clouds,
      icon: icon,
      dayOfWeek: dayOfWeek,  
    );
  }

  @override
  List<Object?> get props => [
        dt,
        pressure,
        humidity,
        wind,
        temp,
        weather,
        deg,
        clouds,
        icon,
        description,
        dayOfWeek,  
      ];
}

class WeatherListFormatter {
  static String formatPressure(double pressure) {
    return Formatter.formatPressure(pressure * 0.750062);
  }

  static String formatHumidity(int humidity) {
    return Formatter.formatHumidity(humidity);
  }

  static String formatWind(double wind) {
    return Formatter.formatWind(wind);
  }

  static String formatTemperature(double temp) {
    return Formatter.formatTemperature(temp);
  }

  static String formatIcon(String icon) {
    return '${Constants.WEATHER_IMAGES_URL}$icon.png';
  }

  static String formatDayOfWeek(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final fullDate = Formatter.getFormattedDate(date);
    return Formatter.getDayOfWeek(fullDate);
  }
}
