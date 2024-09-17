import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation/naviagtion_coordinator.dart';
import '../qubit/location/location_event.dart';
import '../qubit/location/location_qubit.dart';
import '../qubit/location/location_state.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late NavigationCoordinator _navigationCoordinator;

  @override
  void initState() {
    super.initState();
    _navigationCoordinator = NavigationCoordinator(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationBloc>().add(LoadLocationData());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return _buildLoading();
          } else if (state is LocationLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _navigationCoordinator
                  .navigateToWeatherForecastScreen(state.weatherForecast);
            });
            return _buildEmpty();
          } else if (state is LocationError) {
            return _buildError(state.message);
          }
          return _buildNoData();
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: SpinKitDoubleBounce(
        color: Colors.black87,
        size: 100.0,
      ),
    );
  }

  Widget _buildEmpty() {
    return const SizedBox.shrink();
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(
        'Error: $message',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildNoData() {
    return const Center(child: Text("No data"));
  }
}
