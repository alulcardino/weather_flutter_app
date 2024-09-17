import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_flutter_app/pages/weather_forecast_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../features/presentatiom/qubit/location/location_event.dart';
import '../features/presentatiom/qubit/location/location_qubit.dart';
import '../features/presentatiom/qubit/location/location_state.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(LoadLocationData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return const Center(
              child: SpinKitDoubleBounce(
                color: Colors.black87,
                size: 100.0,
              ),
            );
          } else if (state is LocationLoaded) {
            return WeatherForecastScreen(
                locationWeather: state.weatherForecast);
          } else if (state is LocationError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const Center(child: Text("No data"));
        },
      ),
    );
  }
}
