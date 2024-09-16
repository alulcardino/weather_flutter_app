class Coord {
  final double? lon;
  final double? lat;

  Coord({this.lon, this.lat});

  Coord.fromDTO(CoordDTO dto)
      : lon = dto.lon,
        lat = dto.lat;

  CoordDTO toDTO() {
    return CoordDTO(
      lon: lon,
      lat: lat,
    );
  }
}
