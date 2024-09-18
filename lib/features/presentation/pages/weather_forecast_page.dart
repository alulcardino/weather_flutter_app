import 'package:flutter/material.dart';
import 'package:weather_flutter_app/features/domain/entities/weather_forecast_entity.dart';
import 'package:weather_flutter_app/features/presentation/navigation/naviagtion_coordinator.dart';
import 'package:weather_flutter_app/features/presentation/qubit/weather/weather_cubit.dart';
import 'package:weather_flutter_app/features/presentation/qubit/weather/weather_state.dart';
import 'package:weather_flutter_app/features/presentation/widgets/bottom_list_view.dart';
import 'package:weather_flutter_app/features/presentation/widgets/city_view.dart';
import 'package:weather_flutter_app/features/presentation/widgets/detail_view.dart';
import 'package:weather_flutter_app/features/presentation/widgets/temp_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherForecastPage extends StatefulWidget {
  final WeatherForecastEntity locationWeather;
  final void Function(WeatherForecastEntity)? onShowOtherScreen;

  const WeatherForecastPage({
    super.key,
    required this.locationWeather,
    this.onShowOtherScreen,
  });

  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late String _cityName;

  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().fetchWeatherByLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadInProgress) {
            return _buildLoading();
          } else if (state is WeatherLoadSuccess) {
            return _buildWeatherContent(state.weatherForecast);
          } else if (state is WeatherLoadFailure) {
            return _buildError(state.message);
          } else {
            return _buildCityNotFound();
          }
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    final navigationCoordinator = NavigationCoordinator();

    return AppBar(
      backgroundColor: Colors.black87,
      title: const Text(
        'Weather forecast',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.my_location, color: Colors.white),
        onPressed: () {
          context.read<WeatherCubit>().fetchWeatherByLocation();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.location_city, color: Colors.white),
          onPressed: () async {
            var tappedName = await navigationCoordinator.navigateToCityScreen(context);

            if (tappedName != null) {
              setState(() {
                _cityName = tappedName;
                context.read<WeatherCubit>().fetchWeather(_cityName);
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildWeatherContent(WeatherForecastEntity weatherForecast) {
    if (widget.onShowOtherScreen != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onShowOtherScreen!(weatherForecast);
      });
    }

    return Column(
      children: <Widget>[
        const SizedBox(height: 50.0),
        CityView(weatherForecast: weatherForecast),
        const SizedBox(height: 50.0),
        TempView(weatherForecast: weatherForecast),
        const SizedBox(height: 50.0),
        DetailView(weatherForecast: weatherForecast),
        const SizedBox(height: 50.0),
        BottomListView(weatherForecast: weatherForecast),
      ],
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCityNotFound() {
    return const Center(
      child: Text(
        'City not found\nPlease, enter correct city',
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}