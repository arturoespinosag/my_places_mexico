part of 'favorites_bloc.dart';

@freezed
class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.filterSelected({
    PlaceKind? selectedFilter,
  }) = _FilterSelected;
  const factory FavoritesEvent.favoriteAdded({
    required PlaceWithDistance place,
  }) = _FavoriteAdded;
  const factory FavoritesEvent.favoriteRemoved({required String placeId}) =
      _FavoriteRemoved;
}
