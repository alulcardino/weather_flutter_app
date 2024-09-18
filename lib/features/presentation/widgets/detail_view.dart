import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';
import 'package:weather_flutter_app/features/presentation/widgets/forecast_item.dart';


class DetailView extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const DetailView({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.list;

    var forecast = forecastList![0];

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ForecastItem(
            icon: FontAwesomeIcons.thermometerHalf,
            value: forecast.pressure,
            units: "mm Hg"),
        ForecastItem(
            icon: FontAwesomeIcons.cloudRain,
            value: forecast.humidity,
            units: "%"),
        ForecastItem(
            icon: FontAwesomeIcons.wind,
            value: forecast.wind,
            units: "m/s"),
      ],
    );
  }
}
