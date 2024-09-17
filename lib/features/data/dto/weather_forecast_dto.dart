import 'package:equatable/equatable.dart';
import 'package:typed_json/typed_json.dart';
import 'package:weather_flutter_app/features/data/dto/city_dto.dart';
import 'package:weather_flutter_app/features/data/dto/weather_list_dto.dart';

class WeatherForecastDTO extends Equatable {
  final CityDTO city;
  final String cod;
  final double message;
  final int cnt;
  final List<WeatherListDTO>? list;

  const WeatherForecastDTO({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    this.list,
  });

  factory WeatherForecastDTO.fromJson(Json json) {
    return WeatherForecastDTO(
      city: CityDTO.fromJson(json['city']),
      cod: json['cod'].stringOrException,
      message: json['message'].doubleOrException,
      cnt: json['cnt'].intOrException,
      list: json['list']
          .list
          .map((item) => WeatherListDTO.fromJson(item))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [city, cod, message, cnt, list];
}


// json['list']
//           .list
//           .map((item) => WeatherListDTO.fromJson(item))
//           .toList(),