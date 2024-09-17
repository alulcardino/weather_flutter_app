import 'package:equatable/equatable.dart';
import 'package:typed_json/typed_json.dart';

class TempDTO extends Equatable {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  const TempDTO({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory TempDTO.fromJson(Json json) {
    return TempDTO(
      day: _parseToDouble(json['day']),
      min: _parseToDouble(json['min']),
      max: _parseToDouble(json['max']),
      night: _parseToDouble(json['night']),
      eve: _parseToDouble(json['eve']),
      morn: _parseToDouble(json['morn']),
    );
  }

  static double _parseToDouble(Json json) {
    final num value = json.numOrException;
    return value.toDouble();
  }

  @override
  List<Object?> get props => [day, min, max, night, eve, morn];
}
