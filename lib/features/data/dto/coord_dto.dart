import 'package:equatable/equatable.dart';
import 'package:typed_json/typed_json.dart';

class CoordDTO extends Equatable {
  final double? lon;
  final double? lat;

  CoordDTO({this.lon, this.lat});

  factory CoordDTO.fromJson(Json json) {
    return CoordDTO(
      lon: json['lon'].doubleValue,
      lat: json['lat'].doubleValue,
    );
  }

  @override
  List<Object?> get props => [lon, lat];
}
