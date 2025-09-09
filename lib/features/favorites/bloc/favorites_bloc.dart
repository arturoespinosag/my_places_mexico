import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myplaces_mexico/src/src.dart';

part 'favorites_bloc.freezed.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesState()) {
    on<_FilterSelected>(_onFilterSelected);
    on<_FavoriteAdded>(_onFavoriteAdded);
    on<_FavoriteRemoved>(_onFavoriteRemoved);
  }
  void _onFilterSelected(_FilterSelected event, Emitter<FavoritesState> emit) {
    emit(state.copyWith(
      selectedFilter: event.selectedFilter,
    ));
    final displayedFavoritePlaces = <PlaceWithDistance>[];
    if (event.selectedFilter == null) {
      emit(
        state.copyWith(
          displayedFavoritePlaces: state.allFavoritePlaces,
        ),
      );
    } else {
      for (final place in state.allFavoritePlaces) {
        if (place.kind == state.selectedFilter) {
          displayedFavoritePlaces.add(place);
        }
      }
      emit(
        state.copyWith(
          displayedFavoritePlaces: displayedFavoritePlaces,
        ),
      );
    }
  }

  void _onFavoriteAdded(_FavoriteAdded event, Emitter<FavoritesState> emit) {
    final favoritesCopy = state.allFavoritePlaces
      ..map((e) => e).toList()
      ..add(event.place);
    // if (event.place.kind == state.selectedFilter) {
    //   final newDisplayedFavorites =
    //       state.displayedFavoritePlaces.map((e) => e).toList();
    //   newDisplayedFavorites.add(event.place);
    //   emit(state.copyWith(displayedFavoritePlaces: newDisplayedFavorites));
    // }
    emit(
      state.copyWith(
        allFavoritePlaces: favoritesCopy,
      ),
    );
    add(FavoritesEvent.filterSelected(
      selectedFilter: state.selectedFilter,
    ));
  }

  void _onFavoriteRemoved(
      _FavoriteRemoved event, Emitter<FavoritesState> emit) {
    final favoritesCopy = state.allFavoritePlaces
      ..map((e) => e).toList()
      ..removeWhere((e) => e.id == event.placeId);

    emit(
      state.copyWith(
        allFavoritePlaces: favoritesCopy,
      ),
    );
    add(
      FavoritesEvent.filterSelected(
        selectedFilter: state.selectedFilter,
      ),
    );
  }
}
