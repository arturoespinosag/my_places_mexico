import 'package:flutter/material.dart';
import 'package:myplaces_mexico/src/src.dart';

extension PlaceKindExt on PlaceKind {
  IconData getIcon() {
    switch (this) {
      case PlaceKind.restaurant:
        return Icons.restaurant;
      case PlaceKind.grocery:
        return Icons.local_grocery_store;
      case PlaceKind.school:
        return Icons.school;
      case PlaceKind.stationery:
        return Icons.menu_book;
      case PlaceKind.hotel:
        return Icons.hotel;
      case PlaceKind.gasStation:
        return Icons.local_gas_station;
    }
  }
}
