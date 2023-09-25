import 'package:geolocator/geolocator.dart';
import 'package:myplaces_mexico/src/data/models/response/places_with_distance.dart';
import 'package:myplaces_mexico/src/src.dart';

abstract class PlacesUseCase {
  Future<PlacesWithDistance> getPlaces(
      {required String coordinates, required String distance});
  List<PlaceWithDistance> getDistances({
    required List<Place> places,
    required PlaceKind kind,
  });
  Future<Places> getNearbyPlaces(
      {required String query,
      required String coordinates,
      required String distance});
  Future<Position?> getCurrentPosition();
}

class PlacesUseCaseImpl implements PlacesUseCase {
  PlacesUseCaseImpl(this._placesRepository, this._locationService);

  final IPlacesRepository _placesRepository;
  final LocationService _locationService;
  @override
  Future<PlacesWithDistance> getPlaces(
      {required String coordinates, required String distance}) async {
    final restaurants = await _placesRepository.fetchNearbyPlaces(
        'restaurante', coordinates, distance);
    final groceries = await _placesRepository.fetchNearbyPlaces(
        'abarrotes', coordinates, distance);

    final schools = await _placesRepository.fetchNearbyPlaces(
        'escuela', coordinates, distance);
    final stationeries = await _placesRepository.fetchNearbyPlaces(
        'papeleria', coordinates, distance);
    final hotels = await _placesRepository.fetchNearbyPlaces(
        'hotel', coordinates, distance);
    final restaurantsWithDistance =
        getDistances(places: restaurants.places, kind: PlaceKind.restaurant);
    final groceriesWithDistance =
        getDistances(places: groceries.places, kind: PlaceKind.grocery);

    final schoolsWithDistance =
        getDistances(places: schools.places, kind: PlaceKind.school);
    final stationariesWithDistance =
        getDistances(places: stationeries.places, kind: PlaceKind.stationery);
    final hotelsWithDistace =
        getDistances(places: hotels.places, kind: PlaceKind.hotel);
    final places = [
      ...restaurantsWithDistance,
      ...groceriesWithDistance,
      ...schoolsWithDistance,
      ...stationariesWithDistance,
      ...hotelsWithDistace,
    ];
    return Future.value(PlacesWithDistance(
      placesWithDistance: places,
    ));
  }

  @override
  List<PlaceWithDistance> getDistances({
    required List<Place> places,
    required PlaceKind kind,
  }) {
    final placeswithDistance = places.map(
      (e) {
        final distance = _locationService.getDistance(
            latitude: double.parse(e.latitud),
            longitude: double.parse(e.longitud));
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
  Future<Places> getNearbyPlaces(
          {required String query,
          required String coordinates,
          required String distance}) =>
      _placesRepository.fetchNearbyPlaces(query, coordinates, distance);

  @override
  Future<Position?> getCurrentPosition() {
    return _locationService.getCurrentPosition();
  }
}
