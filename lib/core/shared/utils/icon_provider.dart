import 'package:flutter/material.dart';
import 'package:myplaces_mexico/src/src.dart';

IconData getIcon(PlaceKind kind) {
  switch (kind) {
    case PlaceKind.restaurant:
      return Icons.restaurant;
    case PlaceKind.grocery:
      return Icons.local_grocery_store;
    case PlaceKind.school:
      return Icons.school;
    case PlaceKind.stationery:
      return Icons.document_scanner;
    case PlaceKind.hotel:
      return Icons.hotel;
    case PlaceKind.gasStation:
      return Icons.gas_meter;
  }
}
