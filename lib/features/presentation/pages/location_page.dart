import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/features/presentation/navigation/naviagtion_coordinator.dart';
import 'package:weather_flutter_app/features/presentation/qubit/location/location_cubit.dart';
import 'package:weather_flutter_app/features/presentation/qubit/location/location_state.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationCubit>().loadLocationData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is LocationLoadInProgress) {
            return _buildLoading();
          } else if (state is LocationLoadSuccess) {
            // Perform navigation directly in the builder
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final navigationCoordinator = NavigationCoordinator();
              navigationCoordinator
                  .navigateToWeatherForecastScreen(context, state.weatherForecast);
            });
            return _buildEmpty();
          } else if (state is LocationLoadingFailure) {
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