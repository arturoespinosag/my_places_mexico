import 'dart:async';

import 'package:myplaces_mexico/src/src.dart';

class PlacesApi {
  const PlacesApi();

  Future<ApiResult<Places>> search({
    required String query,
    required String coordinates,
    required String distance,
  }) =>
      ClientRequest.request<Places>(
        ApiRequest.get(
          PlacesEndpoint.search(query, coordinates, distance),
        ),
        (dynamic j) {
          List<Place> places = [];
          (j as List<dynamic>)
              .map(
                (e) => places.add(
                  Place.fromJson(e),
                ),
              )
              .toList();
          return Places(places: places);
        },
      );

  Future<ApiResult<Place>> individual({
    required String placeId,
  }) =>
      ClientRequest.request<Place>(
        ApiRequest.get(
          PlacesEndpoint.individual(placeId),
        ),
        (dynamic j) {
          Place place = Place.fromJson((j as List<dynamic>)[0]);

          return place;
        },
      );
}
