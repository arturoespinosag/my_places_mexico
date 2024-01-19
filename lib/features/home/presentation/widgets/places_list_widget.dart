import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

class PlacesListWidget extends StatelessWidget {
  const PlacesListWidget({
    super.key,
    required this.places,
    required this.isList,
    required this.onRefresh,
  });

  final List<PlaceWithDistance> places;
  final bool isList;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: edgeInsetsSymetricH16.copyWith(top: 0),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          displacement: 60,
          child: ListView.builder(
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
              child: PlaceListTileWidget(
                place: places[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
