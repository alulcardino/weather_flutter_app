import 'package:equatable/equatable.dart';
import 'package:typed_json/typed_json.dart';

class FeelsLikeDTO extends Equatable {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLikeDTO({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLikeDTO.fromJson(Json json) {
    return FeelsLikeDTO(
      day: json['day'].doubleOrException,
      night: json['night'].doubleOrException,
      eve: json['eve'].doubleOrException,
      morn: json['morn'].doubleOrException,
    );
  }

  @override
  List<Object?> get props => [day, night, eve, morn];
}
