part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchNearbyPlaces() = _FetchNearbyPlaces;
  const factory HomeEvent.switchHomeList({required bool isList}) =
      _SwitchHomeList;
}
