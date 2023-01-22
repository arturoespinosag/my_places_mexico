part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchNearbyPlaces(
      String query, String coordinates, String distance) = _FetchNearbyPlaces;
  const factory HomeEvent.switchHomeList() = _SwitchHomeList;
}
