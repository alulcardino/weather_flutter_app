import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/features/data/dto/temp_dto.dart';

class TempEntity extends Equatable {
  final double day;
  final double night;
  final double min;
  final double max;

  const TempEntity({
    required this.day,
    required this.night,
    required this.min,
    required this.max,
  });

  TempEntity.fromDTO(TempDTO dto)
      : day = dto.day,
        night = dto.night,
        min = dto.min,
        max = dto.max;

  @override
  List<Object?> get props => [day, night, min, max];
}
