import 'package:flutter/material.dart';
import 'package:weather_flutter_app/features/presentatiom/pages/location_page.dart';
import 'package:provider/provider.dart';
import '../../di/di.dart';
import 'qubit/location/location_qubit.dart';
import 'qubit/weather/weather_qubit.dart';

void main() {
  DependencyInjection.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocationBloc>(
          create: (_) => DependencyInjection.container.resolve<LocationBloc>(),
        ),
        Provider<WeatherBloc>(
          create: (_) => DependencyInjection.container.resolve<WeatherBloc>(),
        ),
      ],
      child: const MaterialApp(
        home: LocationPage(),
      ),
    );
  }
}
