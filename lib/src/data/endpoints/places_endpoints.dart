class PlacesEndpoint {
  const PlacesEndpoint._();
  static const String _token = 'dd7b6015-41f2-40e3-b97f-aa2b332edd16';

  static String search(String query, String coordinates, String distance) =>
      'Buscar/$query/$coordinates/$distance/$_token';

  static String individual(String placeId) => 'Ficha/{$placeId}/$_token';
}
