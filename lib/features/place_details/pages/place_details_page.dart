import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

class PlaceDetailsPage extends StatelessWidget {
  const PlaceDetailsPage({super.key, required this.place});

  final PlaceWithDistance place;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceDetailsBloc(),
      child: PlaceDetailsView(
        place: place,
      ),
    );
  }
}
