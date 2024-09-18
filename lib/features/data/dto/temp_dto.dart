import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:typed_json/typed_json.dart';
import 'package:weather_flutter_app/features/data/adapters/force_double_adapter.dart';

class TempDTO extends Equatable {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  static ForceDoubleJsonAdapter get _adapter =>
      KiwiContainer().resolve<ForceDoubleJsonAdapter>();

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
      day: _adapter.fromJson(json['day']),
      min: _adapter.fromJson(json['min']),
      max: _adapter.fromJson(json['max']),
      night: _adapter.fromJson(json['night']),
      eve: _adapter.fromJson(json['eve']),
      morn: _adapter.fromJson(json['morn']),
    );
  }

  @override
  List<Object?> get props => [day, min, max, night, eve, morn];
}
