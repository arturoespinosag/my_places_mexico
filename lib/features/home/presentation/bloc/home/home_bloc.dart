import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myplaces_mexico/src/src.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required PlacesUseCase placesUseCase})
      : _placesUseCase = placesUseCase,
        super(const HomeState()) {
    on<_FetchNearbyPlaces>(_onFetchNearbyPlaces);
    on<_IndexSelected>(_onIndexSelected);
    on<_MapSelectedPlaceChanged>(_onMapSelectedPlaceChanged);
    on<_PlacesFiltered>(_onPlacesFiltered);
  }

  final PlacesUseCase _placesUseCase;
  late TextEditingController searchController;

  void init() {
    searchController = TextEditingController();
  }

  Future<void> _onFetchNearbyPlaces(
    _FetchNearbyPlaces event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
        locationStatus: LocationStatus.retrieving,
        places: [],
      ),
    );

    var coordinates = '';
    Position? position;
    try {
      position = await _placesUseCase.getCurrentPosition();
      if (position == null) {
        emit(
          state.copyWith(
            locationStatus: LocationStatus.serviceNotEnabled,
          ),
        );
        return;
      } else if (position.latitude == 0 && position.longitude == 0) {
        emit(
          state.copyWith(
            locationStatus: LocationStatus.deniedForever,
          ),
        );
        return;
      } else {
        coordinates = '${position.latitude},${position.longitude}';
        emit(
          state.copyWith(
            currentPosition: position,
            locationStatus: LocationStatus.retrieved,
          ),
        );
      }
    } on Exception catch (e) {
      log(e.toString());
      return;
    }
    const queries = PlaceKind.values;
    final places = <PlaceWithDistance>[];
    var markers = <Marker>{};
    for (final query in queries) {
      try {
        final response = await _placesUseCase.getPlaces(
          query: query.query,
          coordinates: coordinates,
          distance: '500',
          kind: query,
          currentPosition: position,
        );
        places.addAll(response.placesWithDistance);
        markers = await getMarkers(places: places);
      } on Exception catch (_) {
        log('No se encontraron lugares ${query.query}');
        emit(
          state.copyWith(
            status: HomeStatus.error,
          ),
        );
      }
    }
    final sortedPlaces = <PlaceWithDistance>[...places]..sort(
        (a, b) => a.distance.compareTo(b.distance),
      );

    emit(
      state.copyWith(
        status: HomeStatus.loaded,
        places: sortedPlaces,
        markers: markers,
      ),
    );
  }

  void _onIndexSelected(_IndexSelected event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        selectedIndex: event.selectedIndex,
      ),
    );
  }

  void _onMapSelectedPlaceChanged(
    _MapSelectedPlaceChanged event,
    Emitter<HomeState> emit,
  ) {
    PlaceWithDistance? selectedPlace;
    emit(state.copyWith(bottomSheetStatus: BottomSheetStatus.openning));
    if (state.places.any((place) => place.id == event.placeId)) {
      selectedPlace =
          state.places.firstWhere((place) => place.id == event.placeId);
    }
    emit(
      state.copyWith(
        mapSelectedPlace: selectedPlace,
        bottomSheetStatus: BottomSheetStatus.open,
      ),
    );
    emit(state.copyWith(bottomSheetStatus: BottomSheetStatus.closed));
  }

  void _onPlacesFiltered(_PlacesFiltered event, Emitter<HomeState> emit) {
    final filteredPlaces = state.places.where((place) {
      final placeName = place.nombre.toLowerCase();
      final query = event.query.toLowerCase();
      final containsName = placeName.contains(query);
      return containsName;
    }).toList();
    emit(state.copyWith(filteredPlaces: filteredPlaces));
  }

  Future<Set<Marker>> getMarkers({
    required List<PlaceWithDistance> places,
  }) async {
    final markers = <Marker>{};
    for (final place in places) {
      final icon = await BitmapDescriptor.asset(
        const ImageConfiguration(
          size: Size.square(30),
        ),
        place.kind.path,
      );
      final marker = Marker(
        icon: icon,
        markerId: MarkerId(place.id),
        onTap: () => add(HomeEvent.mapSelectedPlaceChanged(placeId: place.id)),
        position: LatLng(
          double.tryParse(place.latitud) ?? 0,
          double.tryParse(place.longitud) ?? 0,
        ),
      );
      markers.add(marker);
    }
    return markers;
  }
}
