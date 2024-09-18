import 'package:flutter/material.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';

class CityView extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const CityView({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weatherForecast.formattedCityCountry,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black87),
        ),
        Text(
          weatherForecast.formattedDate,
          style: const TextStyle(fontSize: 15, color: Colors.black87),
        ),
      ],
    );
  }
}
