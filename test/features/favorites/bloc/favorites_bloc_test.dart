import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

void main() {
  group('FavoritesBloc', () {
    const restaurant = PlaceWithDistance(
      id: '1',
      nombre: 'Restaurante 1',
      razon_social: '',
      tipo_vialidad: 'Calle',
      calle: 'Av 1',
      num_Exterior: '1',
      num_Interior: '',
      colonia: 'Centro',
      cP: '06600',
      telefono: '',
      longitud: '-99.1332',
      latitud: '19.4326',
      distance: 100,
      kind: PlaceKind.restaurant,
    );

    const hotel = PlaceWithDistance(
      id: '2',
      nombre: 'Hotel 1',
      razon_social: '',
      tipo_vialidad: 'Calle',
      calle: 'Av 2',
      num_Exterior: '2',
      num_Interior: '',
      colonia: 'Centro',
      cP: '06600',
      telefono: '',
      longitud: '-99.1332',
      latitud: '19.4326',
      distance: 200,
      kind: PlaceKind.hotel,
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits initial state when created',
      build: FavoritesBloc.new,
      verify: (bloc) {
        expect(bloc.state.selectedFilter, isNull);
        expect(bloc.state.allFavoritePlaces, isEmpty);
        expect(bloc.state.displayedFavoritePlaces, isEmpty);
      },
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'adds a favorite place',
      build: FavoritesBloc.new,
      act: (bloc) => bloc.add(
        const FavoritesEvent.favoriteAdded(place: restaurant),
      ),
      verify: (bloc) {
        expect(bloc.state.allFavoritePlaces.length, 1);
        expect(bloc.state.allFavoritePlaces.first.id, '1');
        expect(bloc.state.displayedFavoritePlaces.length, 1);
      },
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'removes a favorite place',
      build: FavoritesBloc.new,
      seed: () => const FavoritesState(
        displayedFavoritePlaces: [restaurant],
        allFavoritePlaces: [restaurant],
      ),
      act: (bloc) => bloc.add(
        const FavoritesEvent.favoriteRemoved(placeId: '1'),
      ),
      verify: (bloc) {
        expect(bloc.state.allFavoritePlaces.isEmpty, true);
        expect(bloc.state.displayedFavoritePlaces.isEmpty, true);
      },
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'filters displayed favorites by PlaceKind',
      build: FavoritesBloc.new,
      seed: () => const FavoritesState(
        displayedFavoritePlaces: [restaurant, hotel],
        allFavoritePlaces: [restaurant, hotel],
      ),
      act: (bloc) => bloc.add(
        const FavoritesEvent.filterSelected(
          selectedFilter: PlaceKind.restaurant,
        ),
      ),
      verify: (bloc) {
        expect(bloc.state.selectedFilter, PlaceKind.restaurant);
        expect(bloc.state.displayedFavoritePlaces.length, 1);
        expect(bloc.state.displayedFavoritePlaces.first.id, '1');
      },
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'shows all favorites when filter is null',
      build: FavoritesBloc.new,
      seed: () => const FavoritesState(
        selectedFilter: PlaceKind.restaurant,
        displayedFavoritePlaces: [restaurant],
        allFavoritePlaces: [restaurant, hotel],
      ),
      act: (bloc) => bloc.add(
        const FavoritesEvent.filterSelected(),
      ),
      verify: (bloc) {
        expect(bloc.state.selectedFilter, isNull);
        expect(bloc.state.displayedFavoritePlaces.length, 2);
      },
    );
  });
}
