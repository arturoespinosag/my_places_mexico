import 'package:geolocator/geolocator.dart';
import 'package:myplaces_mexico/src/src.dart';

abstract class PlacesUseCase {
  Future<PlacesWithDistance> getPlaces({
    required String query,
    required String coordinates,
    required String distance,
    required PlaceKind kind,
    required Position currentPosition,
  });
  List<PlaceWithDistance> getDistances({
    required List<Place> places,
    required PlaceKind kind,
    required Position currentPosition,
  });
  Future<Places> getNearbyPlaces({
    required String query,
    required String coordinates,
    required String distance,
  });
  Future<Position?> getCurrentPosition();
}

class PlacesUseCaseImpl implements PlacesUseCase {
  PlacesUseCaseImpl(this._placesRepository, this._locationService);

  final IPlacesRepository _placesRepository;
  final LocationService _locationService;
  @override
  Future<PlacesWithDistance> getPlaces({
    required String query,
    required String coordinates,
    required String distance,
    required PlaceKind kind,
    required Position currentPosition,
  }) async {
    final result =
        await _placesRepository.fetchNearbyPlaces(query, coordinates, distance);
    final resultsWithDistance = getDistances(
      places: result.places,
      kind: kind,
      currentPosition: currentPosition,
    );

    return Future.value(
      PlacesWithDistance(
        placesWithDistance: resultsWithDistance,
      ),
    );
  }

  @override
  List<PlaceWithDistance> getDistances({
    required List<Place> places,
    required PlaceKind kind,
    required Position currentPosition,
  }) {
    final placeswithDistance = places.map(
      (e) {
        final distance = _locationService.getDistance(
          currentLatitude: currentPosition.latitude,
          currentLongitude: currentPosition.longitude,
          latitude: double.tryParse(e.latitud) ?? 19.432366683023716,
          longitude: double.tryParse(e.longitud) ?? -99.13323364074559,
        );
        return PlaceWithDistance(
          id: e.id,
          nombre: e.nombre,
          razon_social: e.razon_social,
          tipo_vialidad: e.tipo_vialidad,
          calle: e.calle,
          num_Exterior: e.num_Exterior,
          num_Interior: e.num_Interior,
          colonia: e.colonia,
          cP: e.cP,
          telefono: e.telefono,
          longitud: e.longitud,
          latitud: e.latitud,
          distance: distance,
          kind: kind,
        );
      },
    ).toList();
    return placeswithDistance;
  }

  @override
  Future<Places> getNearbyPlaces({
    required String query,
    required String coordinates,
    required String distance,
  }) =>
      _placesRepository.fetchNearbyPlaces(query, coordinates, distance);

  @override
  Future<Position?> getCurrentPosition() {
    return _locationService.getCurrentPosition();
  }
}
