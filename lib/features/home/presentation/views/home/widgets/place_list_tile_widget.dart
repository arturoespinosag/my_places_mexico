import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

class PlaceListTileWidget extends StatelessWidget {
  const PlaceListTileWidget({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.restaurant),
      title: Text(place.nombre.toTitleCase()),
      trailing: const Icon(Icons.favorite_border_outlined),
    );
  }
}
