import 'package:intl/intl.dart';

class Formatter {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat("EEE, MMM d, y").format(dateTime);
  }

  static String getDayOfWeek(String fullDate) {
    return fullDate.split(',')[0];
  }

  static String formatTemperature(double temp) {
    return "${temp.toStringAsFixed(0)}°C";
  }

  static String formatPressure(double pressure) {
    return "${pressure.round()}";
  }

  static String formatHumidity(int humidity) {
    return "$humidity";
  }

  static String formatWind(double wind) {
    return "${wind.toInt()}";
  }
}
