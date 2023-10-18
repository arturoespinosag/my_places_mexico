import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/firebase_options.dart';

import 'src/src.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final placesRepository = PlacesRepository();
  final locationService = LocationService();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => runApp(
      MyPlacesApp(
        placesRepository: placesRepository,
        locationService: locationService,
      ),
    ),
  );
}
