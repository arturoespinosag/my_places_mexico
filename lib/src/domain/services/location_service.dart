import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService();

  double getDistance({required double latitude, required double longitude}) {
    final distance = Geolocator.distanceBetween(
        19.257463808899686, -99.17140684609475, latitude, longitude);
    return distance;
  }

  Future<Position?> getCurrentPosition() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isEnabled) {
      return null;
    }

    var locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }
    if (locationPermission == LocationPermission.deniedForever) {
      return Position(
        longitude: 0,
        latitude: 0,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0,
      );
    }
    if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse) {
      final position = Geolocator.getCurrentPosition();
      return position;
    }
    return null;
  }
}
