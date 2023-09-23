import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

class PlacesListWidget extends StatelessWidget {
  const PlacesListWidget({
    super.key,
    required this.places,
    required this.isList,
  });

  final List<PlaceWithDistance> places;
  final bool isList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: edgeInsetsSymetricH16.copyWith(top: 0),
        child: ListView.builder(
          padding: edgeInsetsSymetricV20,
          physics: const ClampingScrollPhysics(),
          itemCount: places.length,
          itemBuilder: (context, index) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: isList
                ? PlaceListTileWidget(
                    place: places[index],
                  )
                : PlaceExpandedItemWidget(place: places[index]),
          ),
        ),
      ),
    );
  }
}
