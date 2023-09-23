import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService();

  double getDistance({required double latitude, required double longitude}) {
    final distance = Geolocator.distanceBetween(
        19.257463808899686, -99.17140684609475, latitude, longitude);
    return distance;
  }
}
