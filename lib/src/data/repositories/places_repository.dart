import 'package:myplaces_mexico/src/src.dart';

class PlacesRepository implements IPlacesRepository {
  PlacesRepository() : _placesApi = const PlacesApi();
  final PlacesApi _placesApi;
  @override
  Future<Places> fetchNearbyPlaces(
    String query,
    String coordinates,
    String distance,
  ) async {
    final apiResult = await _placesApi.search(
      query: query,
      coordinates: coordinates,
      distance: distance,
    );
    final places = apiResult.when(
      success: (data) => data,
      failure: (e, s) => throw e,
    );
    return places;
  }

  @override
  Future<Place> fetchPlace(String placeId) async {
    final apiResult = await _placesApi.individual(placeId: placeId);
    final place = apiResult.when(
      success: (data) => data,
      failure: (e, s) => throw e,
    );
    return place;
  }
}
