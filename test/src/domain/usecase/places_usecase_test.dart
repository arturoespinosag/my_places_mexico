import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myplaces_mexico/src/src.dart';

class MockPlacesRepository extends Mock implements IPlacesRepository {}

class MockLocationService extends Mock implements LocationService {}

void main() {
  late MockPlacesRepository mockRepository;
  late MockLocationService mockLocationService;
  late PlacesUseCaseImpl useCase;

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

  setUp(() {
    mockRepository = MockPlacesRepository();
    mockLocationService = MockLocationService();
    useCase = PlacesUseCaseImpl(mockRepository, mockLocationService);
  });

  group('PlacesUseCaseImpl', () {
    test('getCurrentPosition delegates to location service', () async {
      when(
        () => mockLocationService.getCurrentPosition(),
      ).thenAnswer((_) async => mockPosition);

      final result = await useCase.getCurrentPosition();

      expect(result, mockPosition);
      verify(() => mockLocationService.getCurrentPosition()).called(1);
    });

    group('getNearbyPlaces', () {
      test('delegates to repository', () async {
        final places = Places(places: []);
        when(
          () => mockRepository.fetchNearbyPlaces(
            'restaurante',
            '19.4326,-99.1332',
            '500',
          ),
        ).thenAnswer((_) async => places);

        final result = await useCase.getNearbyPlaces(
          query: 'restaurante',
          coordinates: '19.4326,-99.1332',
          distance: '500',
        );

        expect(result, places);
        verify(
          () => mockRepository.fetchNearbyPlaces(
            'restaurante',
            '19.4326,-99.1332',
            '500',
          ),
        ).called(1);
      });
    });

    group('getDistances', () {
      test('calculates distances for each place', () {
        final places = [
          Place(
            cLEE: '1',
            id: '1',
            nombre: 'Place 1',
            razon_social: '',
            clase_actividad: '',
            estrato: '',
            tipo_vialidad: 'Calle',
            calle: 'Av 1',
            num_Exterior: '1',
            num_Interior: '',
            colonia: 'Centro',
            cP: '06600',
            ubicacion: '',
            telefono: '',
            correo_e: '',
            sitio_internet: '',
            tipo: '',
            longitud: '-99.1332',
            latitud: '19.4326',
            centroComercial: '',
            tipoCentroComercial: '',
            numLocal: '',
          ),
        ];
        when(
          () => mockLocationService.getDistance(
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).thenReturn(100);

        final result = useCase.getDistances(
          places: places,
          kind: PlaceKind.restaurant,
          currentPosition: mockPosition,
        );

        expect(result.length, 1);
        expect(result.first.id, '1');
        expect(result.first.distance, 100.0);
        expect(result.first.kind, PlaceKind.restaurant);
      });
    });

    group('getPlaces', () {
      test('fetches places and enriches with distances', () async {
        final places = [
          Place(
            cLEE: '1',
            id: '1',
            nombre: 'Place 1',
            razon_social: '',
            clase_actividad: '',
            estrato: '',
            tipo_vialidad: 'Calle',
            calle: 'Av 1',
            num_Exterior: '1',
            num_Interior: '',
            colonia: 'Centro',
            cP: '06600',
            ubicacion: '',
            telefono: '',
            correo_e: '',
            sitio_internet: '',
            tipo: '',
            longitud: '-99.1332',
            latitud: '19.4326',
            centroComercial: '',
            tipoCentroComercial: '',
            numLocal: '',
          ),
        ];
        when(
          () => mockRepository.fetchNearbyPlaces(
            'restaurante',
            '19.4326,-99.1332',
            '500',
          ),
        ).thenAnswer((_) async => Places(places: places));
        when(
          () => mockLocationService.getDistance(
            currentLatitude: any(named: 'currentLatitude'),
            currentLongitude: any(named: 'currentLongitude'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).thenReturn(100);

        final result = await useCase.getPlaces(
          query: 'restaurante',
          coordinates: '19.4326,-99.1332',
          distance: '500',
          kind: PlaceKind.restaurant,
          currentPosition: mockPosition,
        );

        expect(result.placesWithDistance.length, 1);
        expect(result.placesWithDistance.first.distance, 100.0);
        expect(result.placesWithDistance.first.kind, PlaceKind.restaurant);
      });
    });
  });
}
