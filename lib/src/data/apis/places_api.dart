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
        (dynamic j) => Places.fromJson(j as Map<String, dynamic>),
      );

  Future<ApiResult<Place>> individual({
    required String placeId,
  }) =>
      ClientRequest.request<Place>(
        ApiRequest.get(
          PlacesEndpoint.individual(placeId),
        ),
        (dynamic j) => Place.fromJson(j as Map<String, dynamic>),
      );
}
