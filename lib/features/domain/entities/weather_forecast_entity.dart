class WeatherForecast {
  final City city;
  final String cod;
  final double message;
  final int cnt;
  final List<WeatherList>? list;

  WeatherForecast({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    this.list,
  });

  WeatherForecast.fromDTO(WeatherForecastDTO dto)
      : city = City.fromDTO(dto.city),
        cod = dto.cod,
        message = dto.message,
        cnt = dto.cnt,
        list = dto.list?.map((e) => WeatherList.fromDTO(e)).toList(),;
}