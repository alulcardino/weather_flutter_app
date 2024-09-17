import 'package:equatable/equatable.dart';
import 'package:typed_json/typed_json.dart';

class FeelsLikeDTO extends Equatable {
  final double day;
  final double night;
  final double eve;
  final double morn;

  const FeelsLikeDTO({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLikeDTO.fromJson(Json json) {
    return FeelsLikeDTO(
      day: _parseToDouble(json['day']),
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
  List<Object?> get props => [day, night, eve, morn];
}
