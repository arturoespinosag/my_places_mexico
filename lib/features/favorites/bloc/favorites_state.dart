part of 'favorites_bloc.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    PlaceKind? selectedFilter,
  }) = _FavoritesState;
}
