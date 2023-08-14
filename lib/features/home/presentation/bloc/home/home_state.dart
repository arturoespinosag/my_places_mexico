part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default([]) List<Place> places,
    @Default(true) bool isList,
  }) = _HomeState;
}
