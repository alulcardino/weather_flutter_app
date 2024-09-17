import 'package:equatable/equatable.dart';
import 'package:typed_json/typed_json.dart';

class CoordDTO extends Equatable {
  final double? lon;
  final double? lat;

  const CoordDTO({this.lon, this.lat});

  factory CoordDTO.fromJson(Json json) {
    return CoordDTO(
      lon: _parseToDouble(json['lon']),
      lat: _parseToDouble(json['lat']),
    );
  }

  static double? _parseToDouble(Json json) {
    final num value = json.numOrException;
    return value.toDouble();
  }

  @override
  List<Object?> get props => [lon, lat];
}
