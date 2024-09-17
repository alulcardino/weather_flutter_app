import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_flutter_app/features/presentatiom/widgets/forecast_item.dart';

import '../../domain/entities/weather_forecast_entity.dart';
import '../utils/formatter.dart';

class DetailView extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const DetailView({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.list;

    var pressure = forecastList![0].pressure * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ForecastItem(
            icon: FontAwesomeIcons.thermometerHalf,
            value: Formatter.formatPressure(pressure),
            units: "mm Hg"),
        ForecastItem(
            icon: FontAwesomeIcons.cloudRain,
            value: Formatter.formatHumidity(humidity),
            units: "%"),
        ForecastItem(
            icon: FontAwesomeIcons.wind,
            value: Formatter.formatWind(wind),
            units: "m/s"),
      ],
    );
  }
}
