import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
      ),
    );
    try {
      var response = await _placesUseCase.getPlaces(
        coordinates: event.coordinates,
        distance: event.distance,
      );
      final sortedPlaces = <PlaceWithDistance>[];

      sortedPlaces.addAll(response.placesWithDistance);
      sortedPlaces.sort(
        (a, b) => a.distance.compareTo(b.distance),
      );

      emit(state.copyWith(
        status: HomeStatus.loaded,
        places: sortedPlaces,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
        ),
      );
    }
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
