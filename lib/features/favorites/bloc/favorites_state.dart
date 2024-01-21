part of 'favorites_bloc.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    PlaceKind? selectedFilter,
    @Default([]) List<PlaceWithDistance> displayedFavoritePlaces,
    @Default([]) List<PlaceWithDistance> allFavoritePlaces,
  }) = _FavoritesState;
}
