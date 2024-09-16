import 'package:flutter/material.dart';
import 'package:weather_flutter_app/utils/forecast_util.dart';

Widget forecastCart(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data?.list;

  var date = DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dayOfWeek,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "$tempMin°C",
                  style: TextStyle(fontSize: 26.0, color: Colors.white),
                ),
              )
            ],
          ),
          Image.network(
            icon,
            scale: 1.2,
            color: Colors.white,
          )
        ],
      )
    ],
  );
}
