import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_flutter_app/utils/forecast_util.dart';

import '../features/domain/entities/weather_forecast_entity.dart';

class DetailView extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const DetailView({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.list;

    var pressure = forecastList![0].pressure * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;

    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Util.getItem(
              FontAwesomeIcons.thermometerHalf, pressure.round(), "mm Hg"),
          Util.getItem(FontAwesomeIcons.cloudRain, humidity, "%"),
          Util.getItem(FontAwesomeIcons.wind, wind.toInt(), "m/s"),
        ],
      ),
    );
  }
}
