import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/features/data/dto/weather_forecast_dto.dart';
import 'package:weather_flutter_app/features/domain/entities/city_entity.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_list_entity.dart';
import 'package:weather_flutter_app/features/domain/utils/formatter.dart';


class WeatherForecastEntity extends Equatable {
  final CityEntity city;
  final List<WeatherListEntity>? list;

  final String formattedCityCountry;
  final String formattedDate;

  const WeatherForecastEntity({
    required this.city,
    this.list,
    required this.formattedCityCountry,
    required this.formattedDate,
  });

  factory WeatherForecastEntity.fromDTO(WeatherForecastDTO dto) {
    final city = CityEntity.fromDTO(dto.city);
    final formattedCityCountry = WeatherForecastFormatter.formatCityCountry(city);
    final formattedDate = WeatherForecastFormatter.formatDate(dto.list![0].dt);

    return WeatherForecastEntity(
      city: city,
      list: dto.list?.map((e) => WeatherListEntity.fromDTO(e)).toList(),
      formattedCityCountry: formattedCityCountry,
      formattedDate: formattedDate,
    );
  }

  @override
  List<Object?> get props => [city, list, formattedCityCountry, formattedDate];
}

class WeatherForecastFormatter {
  static String formatCityCountry(CityEntity city) {
    return "${city.name}, ${city.country}";
  }

  static String formatDate(int timestamp) {
    return Formatter.getFormattedDate(
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
    );
  }
}