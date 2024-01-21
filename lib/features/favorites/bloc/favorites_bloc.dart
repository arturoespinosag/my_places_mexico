import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myplaces_mexico/src/src.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';
part 'favorites_bloc.freezed.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesState()) {
    on<_FilterSelected>(_onFilterSelected);
  }
  void _onFilterSelected(_FilterSelected event, Emitter<FavoritesState> emit) {
    emit(state.copyWith(
      selectedFilter: event.selectedFilter,
    ));
  }
}
