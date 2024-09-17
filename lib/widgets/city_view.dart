import 'package:flutter/material.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';
import 'package:weather_flutter_app/utils/forecast_util.dart';

class CityView extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const CityView({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    String city = weatherForecast.city.name;
    String country = weatherForecast.city.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(weatherForecast.list![0].dt * 1000);

    return Column(
      children: [
        Text(
          "$city, $country",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black87),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: const TextStyle(fontSize: 15, color: Colors.black87),
        ),
      ],
    );
  }
}
