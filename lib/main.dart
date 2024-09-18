import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter_app/features/presentation/navigation/naviagtion_coordinator.dart';
import 'package:weather_flutter_app/features/presentation/pages/location_page.dart';
import 'package:weather_flutter_app/features/presentation/qubit/location/location_cubit.dart';
import 'di/di.dart';
import 'features/presentation/qubit/weather/weather_cubit.dart';

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
        BlocProvider<LocationCubit>(
          create: (context) => DependencyInjection.container.resolve<LocationCubit>(),
        ),
        BlocProvider<WeatherCubit>(
          create: (context) => DependencyInjection.container.resolve<WeatherCubit>(),
        ),
        Provider<NavigationCoordinator>(
          create: (context) => NavigationCoordinator(context),
        ),
      ],
      child: const MaterialApp(
        home: LocationPage(),
      ),
    );
  }
}
