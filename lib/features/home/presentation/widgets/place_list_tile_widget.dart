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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const PlaceImage(),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.kind.query.capitalize,
                      style: TextStyle(
                        color: Palette.darkGrey.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 235,
                      child: Text(
                        place.nombre.toTitleCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Palette.spaceBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const PlaceScore(),
                        const SizedBox(width: 15),
                        Text(
                          'a ${place.distance.toStringAsFixed(0)} m',
                          style: TextStyle(
                            color: Palette.darkGrey.withOpacity(0.8),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios),
            const SizedBox(width: 1),
          ],
        ),
      ),
    );
  }
}

class PlaceScore extends StatelessWidget {
  const PlaceScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star_border_outlined,
          color: Palette.darkGrey.withOpacity(0.8),
        ),
      ),
    );
  }
}

class PlaceImage extends StatelessWidget {
  const PlaceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(40),
          ),
          color: Colors.red),
      width: 75,
      height: double.infinity,
    );
  }
}
