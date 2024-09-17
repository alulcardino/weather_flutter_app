import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      var status = await Permission.location.status;
      if (!status.isGranted) {
        if (!await Permission.location.request().isGranted) {
          throw Exception("Location permission denied");
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      throw Exception("Error obtaining location: $e");
    }
  }
}
