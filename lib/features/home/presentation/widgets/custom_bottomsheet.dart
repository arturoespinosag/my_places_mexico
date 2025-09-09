import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/src/src.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    required this.place,
    super.key,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            place.nombre.toTitleCase(),
            style: FontStyles.title,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(place.clase_actividad),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${place.calle} # ${place.num_Exterior} '.toTitleCase(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(place.colonia.toTitleCase()),
        ],
      ),
    );
  }
}

void show(BuildContext context, Place place) {
  showModalBottomSheet<void>(
    context: context,
    builder: (context) => CustomBottomSheet(place: place),
  );
}
