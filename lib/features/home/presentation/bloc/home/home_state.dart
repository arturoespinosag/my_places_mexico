part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default(LocationStatus.unknown) LocationStatus locationStatus,
    @Default([]) List<PlaceWithDistance> places,
    @Default(true) bool isList,
    @Default(0) int selectedIndex,
    PlaceWithDistance? mapSelectedPlace,
    Position? currentPosition,
  }) = _HomeState;
}

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

enum LocationStatus {
  unknown,
  retrieving,
  retrieved,
  deniedForever,
  serviceNotEnabled,
}
