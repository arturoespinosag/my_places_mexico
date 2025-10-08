import 'package:myplaces_mexico/src/src.dart';

abstract class IPlacesRepository {
  Future<Places> fetchNearbyPlaces(
    String query,
    String coordinates,
    String distance,
  );
  Future<Place> fetchPlace(String id);
}
