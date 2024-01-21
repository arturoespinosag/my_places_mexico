import 'package:flutter/material.dart';

import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

class PlacesListWidget extends StatelessWidget {
  const PlacesListWidget({
    super.key,
    required this.places,
    required this.isList,
    required this.onRefresh,
    required this.favoritePlaces,
  });

  final List<PlaceWithDistance> places;
  //TODO(arturo): remove this and add a property to the place that
  // will be used to check wether this place is favorite or not
  final List<PlaceWithDistance> favoritePlaces;
  final bool isList;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: onRefresh,
        displacement: 60,
        child: ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: PlaceListTileWidget(
              place: places[index],
              isFavorite: favoritePlaces.any((e) => e.id == places[index].id),
            ),
          ),
        ),
      ),
    );
  }
}
