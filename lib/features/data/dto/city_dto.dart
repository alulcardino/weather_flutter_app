import 'package:equatable/equatable.dart';
import 'package:typed_json/typed_json.dart';
import 'package:weather_flutter_app/features/data/dto/coord_dto.dart';

class CityDTO extends Equatable {
  final int id;
  final String name;
  final CoordDTO coord;
  final String country;
  final int population;
  final int timezone;

  CityDTO({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
  });

  factory CityDTO.fromJson(Json json) {
    return CityDTO(
      id: json['id'].intOrException,
      name: json['name'].stringOrException,
      coord: CoordDTO.fromJson(json['coord']),
      country: json['country'].stringOrException,
      population: json['population'].intOrException,
      timezone: json['timezone'].intOrException,
    );
  }

  @override
  List<Object?> get props => [id, name, coord, country, population, timezone];
}
