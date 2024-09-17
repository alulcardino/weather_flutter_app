import 'package:equatable/equatable.dart';

import '../../data/dto/coord_dto.dart';

class CoordEntity extends Equatable {
  final double? lon;
  final double? lat;

  const CoordEntity({this.lon, this.lat});

  CoordEntity.fromDTO(CoordDTO dto)
      : lon = dto.lon,
        lat = dto.lat;

  @override
  List<Object?> get props => [lon, lat];
}
