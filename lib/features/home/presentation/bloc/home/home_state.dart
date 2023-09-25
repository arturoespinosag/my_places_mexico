part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

enum LocationStatus {
  unknown,
  retrieved,
  deniedForever,
  serviceNotEnabled,
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default(LocationStatus.unknown) LocationStatus locationStatus,
    @Default([]) List<PlaceWithDistance> places,
    @Default(true) bool isList,
  }) = _HomeState;
}
