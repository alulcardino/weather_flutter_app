import 'package:typed_json/typed_json.dart';

class TempDTO {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  TempDTO({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory TempDTO.fromJson(Json json) {
    return TempDTO(
      day: json['day'].doubleOrException,
      min: json['min'].doubleOrException,
      max: json['max'].doubleOrException,
      night: json['night'].doubleOrException,
      eve: json['eve'].doubleOrException,
      morn: json['morn'].doubleOrException,
    );
  }

  Json toJson() {
    final json = Json.object();
    json['day'] = Json(day);
    json['min'] = Json(min);
    json['max'] = Json(max);
    json['night'] = Json(night);
    json['eve'] = Json(eve);
    json['morn'] = Json(morn);
    return json;
  }
}
