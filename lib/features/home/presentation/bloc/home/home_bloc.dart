import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myplaces_mexico/src/src.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required IPlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(const HomeState()) {
    on<_FetchNearbyPlaces>(_onFetchNearbyPlaces);
  }

  final IPlacesRepository _placesRepository;

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
      final response = await _placesRepository.fetchNearbyPlaces(
        event.query,
        event.coordinates,
        event.distance,
      );
      emit(state.copyWith(
        status: HomeStatus.loaded,
        places: response.places,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
        ),
      );
    }
  }
}
