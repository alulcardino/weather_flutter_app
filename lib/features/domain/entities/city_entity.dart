class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
  });

  City.fromDTO(CityDTO dto)
      : id = dto.id,
        name = dto.name,
        coord = Coord.fromDTO(dto.coord),
        country = dto.country,
        population = dto.population,
        timezone = dto.timezone;

  CityDTO toDTO() {
    return CityDTO(
      id: id,
      name: name,
      coord: coord.toDTO(),
      country: country,
      population: population,
      timezone: timezone,
    );
  }
}
