import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myplaces_mexico/src/src.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required PlacesUseCase placesUseCase})
      : _placesUseCase = placesUseCase,
        super(const HomeState()) {
    on<_FetchNearbyPlaces>(_onFetchNearbyPlaces);
    on<_SwitchHomeList>(_onSwitchHomeList);
  }

  final PlacesUseCase _placesUseCase;

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
        emit(state.copyWith(
          locationStatus: LocationStatus.deniedForever,
        ));
        return;
      } else {
        coordinates = '${position.latitude},${position.longitude}';
        emit(state.copyWith(locationStatus: LocationStatus.retrieved));
      }
    } catch (e) {
      log(e.toString());
      return;
    }
    const queries = PlaceKind.values;
    final places = <PlaceWithDistance>[];
    for (final query in queries) {
      try {
        var response = await _placesUseCase.getPlaces(
          query: query.query,
          coordinates: coordinates,
          distance: '500',
          kind: query,
          currentPosition: position,
        );
        places.addAll(response.placesWithDistance);
      } catch (e) {
        log('No se encontraron lugares ${query.query}');
        emit(
          state.copyWith(
            status: HomeStatus.error,
          ),
        );
      }
    }
    final sortedPlaces = <PlaceWithDistance>[];

    sortedPlaces.addAll(places);
    sortedPlaces.sort(
      (a, b) => a.distance.compareTo(b.distance),
    );

    emit(state.copyWith(
      status: HomeStatus.loaded,
      places: sortedPlaces,
    ));
  }

  Future<void> _onSwitchHomeList(
    _SwitchHomeList event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(isList: !state.isList),
    );
  }
}
