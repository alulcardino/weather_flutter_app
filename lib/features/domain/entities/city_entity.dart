import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/features/data/dto/city_dto.dart';
import 'package:weather_flutter_app/features/domain/entities/coord_entity.dart';


class CityEntity extends Equatable {
  final int id;
  final String name;
  final CoordEntity coord;
  final String country;

  const CityEntity({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
  });

  CityEntity.fromDTO(CityDTO dto)
      : id = dto.id,
        name = dto.name,
        coord = CoordEntity.fromDTO(dto.coord),
        country = dto.country;

  @override
  List<Object?> get props => [id, name, coord, country];
}
