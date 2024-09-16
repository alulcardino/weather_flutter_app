class CoordDTO {
  final double? lon;
  final double? lat;

  CoordDTO({this.lon, this.lat});

  factory CoordDTO.fromJson(Json json) {
    return CoordDTO(
      lon: json['lon']?.doubleValue,
      lat: json['lat']?.doubleValue,
    );
  }

  Json toJson() {
    final json = Json.object();
    if (lon != null) json['lon'] = Json(lon!);
    if (lat != null) json['lat'] = Json(lat!);
    return json;
  }
}
