part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchNearbyPlaces() = _FetchNearbyPlaces;
  const factory HomeEvent.indexSelected({required int selectedIndex}) =
      _IndexSelected;
  const factory HomeEvent.mapSelectedPlaceChanged({required String placeId}) =
      _MapSelectedPlaceChanged;
}
