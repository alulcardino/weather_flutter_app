import 'package:flutter/material.dart';
import 'package:weather_flutter_app/features/presentatiom/widgets/forecast_card.dart';
import '../../domain/entities/weather_forecast_entity.dart';

class BottomListView extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const BottomListView({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "7-day forecast".toUpperCase(),
          style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
        ),
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Colors.black87,
              child: forecastCart(weatherForecast, index),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemCount: weatherForecast.list!.length,
          ),
        ),
      ],
    );
  }
}
