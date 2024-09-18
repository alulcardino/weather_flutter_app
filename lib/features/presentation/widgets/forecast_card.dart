import 'package:flutter/material.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';

Widget forecastCart(WeatherForecastEntity weatherForecast, int index) {
  var forecastList = weatherForecast.list!;
  var forecast = forecastList[index];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          forecast.dayOfWeek,  
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              forecast.temp,
              style: const TextStyle(fontSize: 26.0, color: Colors.white),
            ),
          ),
          Image.network(
            forecast.icon,
            scale: 1.2,
            color: Colors.white,
          ),
        ],
      ),
    ],
  );
}