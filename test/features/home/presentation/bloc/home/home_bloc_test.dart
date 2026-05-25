import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

class MockPlacesUseCase extends Mock implements PlacesUseCase {}

class TestableHomeBloc extends HomeBloc {
  TestableHomeBloc({required super.placesUseCase});

  @override
  Future<Set<Marker>> getMarkers({
    required List<PlaceWithDistance> places,
  }) async {
    return {};
  }
}

void main() {
  late MockPlacesUseCase mockUseCase;

  final mockPosition = Position(
    latitude: 19.4326,
    longitude: -99.1332,
    timestamp: DateTime.now(),
    accuracy: 10,
    altitude: 0,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  const place = PlaceWithDistance(
    id: '1',
    nombre: 'Test Place',
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

  setUp(() {
    mockUseCase = MockPlacesUseCase();
  });

  group('HomeBloc', () {
    blocTest<HomeBloc, HomeState>(
      'emits initial state when created',
      build: () => TestableHomeBloc(placesUseCase: mockUseCase),
      verify: (bloc) {
        expect(bloc.state.status, HomeStatus.initial);
        expect(bloc.state.selectedIndex, 0);
        expect(bloc.state.places, isEmpty);
        expect(bloc.state.markers, isEmpty);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'init creates the search controller',
      build: () => TestableHomeBloc(placesUseCase: mockUseCase),
      act: (bloc) => bloc.init(),
      verify: (bloc) {
        expect(bloc.searchController, isNotNull);
      },
    );

    group('indexSelected', () {
      blocTest<HomeBloc, HomeState>(
        'updates selected index',
        build: () => TestableHomeBloc(placesUseCase: mockUseCase),
        act: (bloc) =>
            bloc.add(const HomeEvent.indexSelected(selectedIndex: 2)),
        expect: () => [
          predicate<HomeState>((state) => state.selectedIndex == 2),
        ],
      );
    });

    group('filterPlaces', () {
      blocTest<HomeBloc, HomeState>(
        'filters places by query',
        build: () => TestableHomeBloc(placesUseCase: mockUseCase),
        seed: () => HomeState(
          status: HomeStatus.loaded,
          places: [
            place,
            const PlaceWithDistance(
              id: '2',
              nombre: 'Otra cosa',
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
            ),
          ],
          locationStatus: LocationStatus.retrieved,
          currentPosition: mockPosition,
        ),
        act: (bloc) => bloc.add(const HomeEvent.filterPlaces(query: 'test')),
        expect: () => [
          predicate<HomeState>(
            (state) =>
                state.filteredPlaces.length == 1 &&
                state.filteredPlaces.first.id == '1',
          ),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'returns all places when query is empty',
        build: () => TestableHomeBloc(placesUseCase: mockUseCase),
        seed: () => HomeState(
          status: HomeStatus.loaded,
          places: [place],
          locationStatus: LocationStatus.retrieved,
          currentPosition: mockPosition,
        ),
        act: (bloc) => bloc.add(const HomeEvent.filterPlaces(query: '')),
        verify: (bloc) {
          expect(bloc.state.filteredPlaces.length, 1);
        },
      );
    });

    group('fetchNearbyPlaces', () {
      blocTest<HomeBloc, HomeState>(
        'sets loading state then loaded when successful',
        build: () => TestableHomeBloc(placesUseCase: mockUseCase),
        setUp: () {
          when(
            () => mockUseCase.getCurrentPosition(),
          ).thenAnswer((_) async => mockPosition);
          for (final kind in PlaceKind.values) {
            when(
              () => mockUseCase.getPlaces(
                query: kind.query,
                coordinates: '19.4326,-99.1332',
                distance: '500',
                kind: kind,
                currentPosition: mockPosition,
              ),
            ).thenAnswer(
              (_) async => const PlacesWithDistance(placesWithDistance: []),
            );
          }
        },
        act: (bloc) => bloc.add(const HomeEvent.fetchNearbyPlaces()),
        expect: () => [
          predicate<HomeState>(
            (state) =>
                state.status == HomeStatus.loading &&
                state.locationStatus == LocationStatus.retrieving,
          ),
          predicate<HomeState>(
            (state) =>
                state.locationStatus == LocationStatus.retrieved &&
                state.currentPosition == mockPosition,
          ),
          predicate<HomeState>(
            (state) =>
                state.status == HomeStatus.loaded &&
                state.locationStatus == LocationStatus.retrieved,
          ),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'handles null position (service not enabled)',
        build: () => TestableHomeBloc(placesUseCase: mockUseCase),
        setUp: () {
          when(
            () => mockUseCase.getCurrentPosition(),
          ).thenAnswer((_) async => null);
        },
        act: (bloc) => bloc.add(const HomeEvent.fetchNearbyPlaces()),
        expect: () => [
          predicate<HomeState>(
            (state) =>
                state.status == HomeStatus.loading &&
                state.locationStatus == LocationStatus.retrieving,
          ),
          predicate<HomeState>(
            (state) => state.locationStatus == LocationStatus.serviceNotEnabled,
          ),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'handles denied forever (0,0 position)',
        build: () => TestableHomeBloc(placesUseCase: mockUseCase),
        setUp: () {
          final deniedPosition = Position(
            latitude: 0,
            longitude: 0,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            altitudeAccuracy: 0,
            heading: 0,
            headingAccuracy: 0,
            speed: 0,
            speedAccuracy: 0,
          );
          when(
            () => mockUseCase.getCurrentPosition(),
          ).thenAnswer((_) async => deniedPosition);
        },
        act: (bloc) => bloc.add(const HomeEvent.fetchNearbyPlaces()),
        expect: () => [
          predicate<HomeState>(
            (state) =>
                state.status == HomeStatus.loading &&
                state.locationStatus == LocationStatus.retrieving,
          ),
          predicate<HomeState>(
            (state) => state.locationStatus == LocationStatus.deniedForever,
          ),
        ],
      );
    });

    group('mapSelectedPlaceChanged', () {
      blocTest<HomeBloc, HomeState>(
        'selects a place that exists in the list',
        build: () => TestableHomeBloc(placesUseCase: mockUseCase),
        seed: () => HomeState(
          status: HomeStatus.loaded,
          places: [place],
          locationStatus: LocationStatus.retrieved,
          currentPosition: mockPosition,
        ),
        act: (bloc) => bloc.add(
          const HomeEvent.mapSelectedPlaceChanged(placeId: '1'),
        ),
        expect: () => [
          predicate<HomeState>(
            (state) => state.bottomSheetStatus == BottomSheetStatus.openning,
          ),
          predicate<HomeState>(
            (state) =>
                state.mapSelectedPlace?.id == '1' &&
                state.bottomSheetStatus == BottomSheetStatus.open,
          ),
          predicate<HomeState>(
            (state) => state.bottomSheetStatus == BottomSheetStatus.closed,
          ),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'handles non-existent place id gracefully',
        build: () => TestableHomeBloc(placesUseCase: mockUseCase),
        seed: () => HomeState(
          status: HomeStatus.loaded,
          places: [place],
          locationStatus: LocationStatus.retrieved,
          currentPosition: mockPosition,
        ),
        act: (bloc) => bloc.add(
          const HomeEvent.mapSelectedPlaceChanged(placeId: 'nonexistent'),
        ),
        expect: () => [
          predicate<HomeState>(
            (state) => state.bottomSheetStatus == BottomSheetStatus.openning,
          ),
          predicate<HomeState>(
            (state) =>
                state.mapSelectedPlace == null &&
                state.bottomSheetStatus == BottomSheetStatus.open,
          ),
          predicate<HomeState>(
            (state) => state.bottomSheetStatus == BottomSheetStatus.closed,
          ),
        ],
      );
    });
  });
}
