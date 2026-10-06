import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/firebase_options.dart';
import 'package:myplaces_mexico/src/src.dart';
import 'package:rive/rive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveNative.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final placesRepository = PlacesRepository();
  final locationService = LocationService();

  runApp(
    MyPlacesApp(
      placesRepository: placesRepository,
      locationService: locationService,
    ),
  );
}
