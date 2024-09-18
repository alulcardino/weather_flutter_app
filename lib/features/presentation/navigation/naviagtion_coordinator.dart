import 'package:flutter/material.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';
import 'package:weather_flutter_app/features/presentation/pages/city_page.dart';
import 'package:weather_flutter_app/features/presentation/pages/weather_forecast_page.dart';


class NavigationCoordinator {
  final BuildContext context;

  NavigationCoordinator(this.context);

  Future<void> navigateToCityScreen() async {
    final cityName = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const CityPage()),
    );

    if (context.mounted && cityName != null) {
      Navigator.pop(context, cityName);
    }
  }

  void navigateToWeatherForecastScreen(WeatherForecastEntity weatherForecast) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherForecastPage(
          locationWeather: weatherForecast,
          onShowOtherScreen: (forecast) {
          },
        ),
      ),
    );
  }
}
