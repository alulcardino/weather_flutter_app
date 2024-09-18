import 'package:flutter/material.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';

class TempView extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const TempView({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
  var forecastList = weatherForecast.list!;
  var forecast = forecastList[0];

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.network(
        forecast.icon,
        scale: 0.4,
        color: Colors.black87,
      ),
      const SizedBox(width: 20.0),
      Column(
        children: [
          Text(
            forecast.temp,
            style: const TextStyle(fontSize: 54, color: Colors.black87),
          ),
          Text(
            forecast.description,
            style: const TextStyle(fontSize: 18.0, color: Colors.black87),
          ),
        ],
      ),
    ],
  );
}
}
