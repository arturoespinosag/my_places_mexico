import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

class PlaceDetailsPage extends StatelessWidget {
  const PlaceDetailsPage({required this.place, super.key});

  final PlaceWithDistance? place;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceDetailsBloc(),
      child: place == null
          ? const SizedBox.shrink()
          : PlaceDetailsView(
              place: place!,
            ),
    );
  }
}
