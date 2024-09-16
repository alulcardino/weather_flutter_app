import 'package:flutter/material.dart';
import 'package:weather_flutter_app/models/weather_forecast_daily.dart';
import 'package:weather_flutter_app/utils/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CityView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    String city = snapshot.data!.city.name;
    String country = snapshot.data!.city.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data!.list![0].dt * 1000);

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
