import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/src/src.dart';

class PlaceListTileWidget extends StatelessWidget {
  const PlaceListTileWidget({
    super.key,
    required this.place,
  });

  final PlaceWithDistance place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(getIcon(place.kind)),
      title: Text(place.nombre.toTitleCase()),
      subtitle: Text('a ${place.distance.toStringAsFixed(0)} m'),
      trailing: const AnimatedHeartWidget(),
    );
  }
}
