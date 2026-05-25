import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

void main() {
  group('PlaceKind', () {
    test('has correct values for restaurant', () {
      expect(PlaceKind.restaurant.query, 'restaurante');
      expect(PlaceKind.restaurant.path, 'assets/icons/restaurant.png');
    });

    test('has correct values for grocery', () {
      expect(PlaceKind.grocery.query, 'abarrotes');
      expect(PlaceKind.grocery.path, 'assets/icons/grocery.png');
    });

    test('has correct values for school', () {
      expect(PlaceKind.school.query, 'escuela');
      expect(PlaceKind.school.path, 'assets/icons/school.png');
    });

    test('has correct values for stationery', () {
      expect(PlaceKind.stationery.query, 'papeleria');
      expect(PlaceKind.stationery.path, 'assets/icons/stationery.png');
    });

    test('has correct values for hotel', () {
      expect(PlaceKind.hotel.query, 'hotel');
      expect(PlaceKind.hotel.path, 'assets/icons/hotel.png');
    });

    test('has correct values for gasStation', () {
      expect(PlaceKind.gasStation.query, 'gasolineria');
      expect(PlaceKind.gasStation.path, 'assets/icons/gas_station.png');
    });

    test('has 6 values', () {
      expect(PlaceKind.values.length, 6);
    });
  });
}
