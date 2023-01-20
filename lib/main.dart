import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/app/my_places_app.dart';

import 'src/src.dart';

void main() {
  final placesRepository = PlacesRepository();
  runApp(
    MyPlacesApp(
      placesRepository: placesRepository,
    ),
  );
}
