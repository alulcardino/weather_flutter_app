import 'package:flutter/material.dart';
import 'package:weather_flutter_app/pages/location_page.dart';
import 'package:provider/provider.dart';
import 'di/di.dart';
import 'features/presentatiom/qubit/location/location_qubit.dart';
import 'features/presentatiom/qubit/weather/weather_qubit.dart';

void main() {
  DependencyInjection.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => DependencyInjection.container.resolve<LocationBloc>(),
        ),
        Provider(
          create: (_) => DependencyInjection.container.resolve<WeatherBloc>(),
        ),
        // Другие провайдеры, если есть
      ],
      child: const MaterialApp(
        home: LocationScreen(),
      ),
    );
  }
}
