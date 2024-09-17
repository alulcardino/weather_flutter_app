import 'package:equatable/equatable.dart';
import 'package:typed_json/typed_json.dart';

class WeatherDTO extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDTO({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDTO.fromJson(Json json) {
    return WeatherDTO(
      id: json['id'].intOrException,
      main: json['main'].stringOrException,
      description: json['description'].stringOrException,
      icon: json['icon'].stringOrException,
    );
  }

  @override
  List<Object?> get props => [id, main, description, icon];
}
