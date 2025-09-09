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
          final places = <Place>[];
          (j as List<dynamic>)
              .map(
                (e) => places.add(
                  Place.fromJson(e as Map<String, dynamic>),
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
          final place =
              Place.fromJson((j as List<dynamic>)[0] as Map<String, dynamic>);
          return place;
        },
      );
}
