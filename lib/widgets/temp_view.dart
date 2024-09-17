import 'package:flutter/material.dart';
import '../features/domain/entities/weather_forecast_entity.dart';

class TempView extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const TempView({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.list;
    var icon = forecastList?[0].getIconUrl();
    var temp = forecastList?[0].temp.day.toStringAsFixed(0);
    var description = forecastList?[0].weather[0].description;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            icon!,
            scale: 0.4,
            color: Colors.black87,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            children: [
              Text(
                "$temp°C",
                style: const TextStyle(fontSize: 54, color: Colors.black87),
              ),
              Text(
                "$description",
                style: const TextStyle(fontSize: 18.0, color: Colors.black87),
              )
            ],
          )
        ],
      ),
    );
  }
}
