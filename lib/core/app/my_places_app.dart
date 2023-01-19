import 'package:flutter/material.dart';
import 'package:myplaces_mexico/features/features.dart';

class MyPlacesApp extends StatelessWidget {
  const MyPlacesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
