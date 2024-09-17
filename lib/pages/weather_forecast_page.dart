import 'package:flutter/material.dart';
import 'package:weather_flutter_app/pages/city_page.dart';
import 'package:weather_flutter_app/widgets/bottom_list_view.dart';
import 'package:weather_flutter_app/widgets/city_view.dart';
import 'package:weather_flutter_app/widgets/detail_view.dart';
import 'package:weather_flutter_app/widgets/temp_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../features/domain/entities/weather_forecast_entity.dart';
import '../features/presentatiom/qubit/weather/weather_event.dart';
import '../features/presentatiom/qubit/weather/weather_qubit.dart';
import '../features/presentatiom/qubit/weather/weather_state.dart';

class WeatherForecastScreen extends StatefulWidget {
  final WeatherForecastEntity
      locationWeather; // Получаем данные с предыдущего экрана

  const WeatherForecastScreen({Key? key, required this.locationWeather})
      : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
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
      appBar: AppBar(
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
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const CityScreen();
              }));
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
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return Column(
              children: <Widget>[
                const SizedBox(height: 50.0),
                CityView(weatherForecast: state.weatherForecast),
                const SizedBox(height: 50.0),
                TempView(weatherForecast: state.weatherForecast),
                const SizedBox(height: 50.0),
                DetailView(weatherForecast: state.weatherForecast),
                const SizedBox(height: 50.0),
                BottomListView(weatherForecast: state.weatherForecast),
              ],
            );
          } else if (state is WeatherError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return const Center(
              child: Text(
                'City not found\nPlease, enter correct city',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
