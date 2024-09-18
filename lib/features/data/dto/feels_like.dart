import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:typed_json/typed_json.dart';
import 'package:weather_flutter_app/features/data/adapters/force_double_adapter.dart';

class FeelsLikeDTO extends Equatable {
  final double day;
  final double night;
  final double eve;
  final double morn;

  static ForceDoubleJsonAdapter get _adapter =>
      KiwiContainer().resolve<ForceDoubleJsonAdapter>();

  const FeelsLikeDTO({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLikeDTO.fromJson(Json json) {
    return FeelsLikeDTO(
      day: _adapter.fromJson(json['day']),
      night: _adapter.fromJson(json['night']),
      eve: _adapter.fromJson(json['eve']),
      morn: _adapter.fromJson(json['morn']),
    );
  }

  @override
  List<Object?> get props => [day, night, eve, morn];
}
