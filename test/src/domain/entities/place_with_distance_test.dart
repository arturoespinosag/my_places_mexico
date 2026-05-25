import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/src/src.dart';

void main() {
  group('PlaceWithDistance', () {
    const place = PlaceWithDistance(
      id: '1',
      nombre: 'TEST PLACE',
      razon_social: 'Test Razón Social',
      tipo_vialidad: 'Calle',
      calle: 'Av Principal',
      num_Exterior: '123',
      num_Interior: '',
      colonia: 'centro',
      cP: '06600',
      telefono: '555-1234',
      longitud: '-99.1332',
      latitud: '19.4326',
      distance: 150,
      kind: PlaceKind.restaurant,
    );

    test('has correct id', () {
      expect(place.id, '1');
    });

    test('has correct nombre', () {
      expect(place.nombre, 'TEST PLACE');
    });

    test('has correct kind', () {
      expect(place.kind, PlaceKind.restaurant);
    });

    test('has correct distance', () {
      expect(place.distance, 150.0);
    });

    test('supports value equality', () {
      const same = PlaceWithDistance(
        id: '1',
        nombre: 'TEST PLACE',
        razon_social: 'Test Razón Social',
        tipo_vialidad: 'Calle',
        calle: 'Av Principal',
        num_Exterior: '123',
        num_Interior: '',
        colonia: 'centro',
        cP: '06600',
        telefono: '555-1234',
        longitud: '-99.1332',
        latitud: '19.4326',
        distance: 150,
        kind: PlaceKind.restaurant,
      );
      expect(place, same);
    });

    test('differs when id changes', () {
      const different = PlaceWithDistance(
        id: '2',
        nombre: 'TEST PLACE',
        razon_social: 'Test Razón Social',
        tipo_vialidad: 'Calle',
        calle: 'Av Principal',
        num_Exterior: '123',
        num_Interior: '',
        colonia: 'centro',
        cP: '06600',
        telefono: '555-1234',
        longitud: '-99.1332',
        latitud: '19.4326',
        distance: 150,
        kind: PlaceKind.restaurant,
      );
      expect(place, isNot(different));
    });
  });

  group('PlaceAddress extension', () {
    const place = PlaceWithDistance(
      id: '1',
      nombre: 'El Buen Café',
      razon_social: '',
      tipo_vialidad: 'Calle',
      calle: 'Av Reforma',
      num_Exterior: '42',
      num_Interior: '',
      colonia: 'juarez',
      cP: '06600',
      telefono: '',
      longitud: '-99.1332',
      latitud: '19.4326',
      distance: 200,
      kind: PlaceKind.restaurant,
    );

    test('returns formatted address', () {
      expect(place.address, 'Av Reforma # 42, Juarez');
    });
  });
}
