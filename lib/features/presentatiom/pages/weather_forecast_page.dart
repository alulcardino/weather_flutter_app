import 'package:flutter/material.dart';
import 'package:weather_flutter_app/features/presentatiom/pages/city_page.dart';
import 'package:weather_flutter_app/features/presentatiom/widgets/bottom_list_view.dart';
import 'package:weather_flutter_app/features/presentatiom/widgets/city_view.dart';
import 'package:weather_flutter_app/features/presentatiom/widgets/detail_view.dart';
import 'package:weather_flutter_app/features/presentatiom/widgets/temp_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/weather_forecast_entity.dart';
import '../qubit/weather/weather_event.dart';
import '../qubit/weather/weather_qubit.dart';
import '../qubit/weather/weather_state.dart';

class WeatherForecastPage extends StatefulWidget {
  final WeatherForecastEntity locationWeather;

  const WeatherForecastPage({super.key, required this.locationWeather});

  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late String _cityName;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context)
        .add(FetchWeatherByLocation(widget.locationWeather));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return _buildLoading();
          } else if (state is WeatherLoaded) {
            return _buildWeatherContent(state.weatherForecast);
          } else if (state is WeatherError) {
            return _buildError(state.message);
          } else {
            return _buildCityNotFound();
          }
        },
      ),
    );
  }

  AppBar _buildAppBar() {
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
          BlocProvider.of<WeatherBloc>(context)
              .add(FetchWeatherByLocation(widget.locationWeather));
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.location_city, color: Colors.white),
          onPressed: () async {
            var tappedName = await Navigator.push<String>(
              context,
              MaterialPageRoute(builder: (context) => const CityPage()),
            );
            if (tappedName != null) {
              setState(() {
                _cityName = tappedName;
                BlocProvider.of<WeatherBloc>(context)
                    .add(FetchWeather(_cityName));
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
