import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/core/shared/shared.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

void main() {
  group('PlaceKindExt', () {
    test('restaurant returns Icons.restaurant', () {
      expect(PlaceKind.restaurant.getIcon(), Icons.restaurant);
    });

    test('grocery returns Icons.local_grocery_store', () {
      expect(PlaceKind.grocery.getIcon(), Icons.local_grocery_store);
    });

    test('school returns Icons.school', () {
      expect(PlaceKind.school.getIcon(), Icons.school);
    });

    test('stationery returns Icons.menu_book', () {
      expect(PlaceKind.stationery.getIcon(), Icons.menu_book);
    });

    test('hotel returns Icons.hotel', () {
      expect(PlaceKind.hotel.getIcon(), Icons.hotel);
    });

    test('gasStation returns Icons.local_gas_station', () {
      expect(PlaceKind.gasStation.getIcon(), Icons.local_gas_station);
    });
  });
}
