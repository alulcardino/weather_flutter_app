import 'package:typed_json/typed_json.dart';
import 'package:weather_flutter_app/features/data/dto/feels_like.dart';
import 'package:weather_flutter_app/features/data/dto/temp_dto.dart';
import 'package:weather_flutter_app/features/data/dto/weather_dto';

class WeatherListDTO {
  final int dt;
  final int sunrise;
  final int sunset;
  final TempDTO temp;
  final FeelsLikeDTO feelsLike;
  final int pressure;
  final int humidity;
  final List<WeatherDTO> weather;
  final double speed;
  final int deg;
  final int clouds;

  WeatherListDTO({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.clouds,
  });

  factory WeatherListDTO.fromJson(Json json) {
    return WeatherListDTO(
      dt: json['dt'].intOrException,
      sunrise: json['sunrise'].intOrException,
      sunset: json['sunset'].intOrException,
      temp: TempDTO.fromJson(json['temp']),
      feelsLike: FeelsLikeDTO.fromJson(json['feels_like']),
      pressure: json['pressure'].intOrException,
      humidity: json['humidity'].intOrException,
      weather: (json['weather'] as List)
          .map((item) => WeatherDTO.fromJson(item))
          .toList(),
      speed: json['speed'].doubleOrException,
      deg: json['deg'].intOrException,
      clouds: json['clouds'].intOrException,
    );
  }

  Json toJson() {
    final json = Json.object();
    json['dt'] = Json(dt);
    json['sunrise'] = Json(sunrise);
    json['sunset'] = Json(sunset);
    json['temp'] = temp.toJson();
    json['feels_like'] = feelsLike.toJson();
    json['pressure'] = Json(pressure);
    json['humidity'] = Json(humidity);

    final weatherList = Json.list();
    for (var item in weather) {
      weatherList.list.add(item.toJson());
    }
    json['weather'] = weatherList;

    json['speed'] = Json(speed);
    json['deg'] = Json(deg);
    json['clouds'] = Json(clouds);
    return json;
  }
}
