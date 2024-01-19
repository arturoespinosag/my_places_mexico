import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

class PlaceListTileWidget extends StatelessWidget {
  const PlaceListTileWidget({
    super.key,
    required this.place,
    required this.isFavorite,
  });

  final PlaceWithDistance place;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
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
                const PlaceImageWidget(),
                const SizedBox(width: 20),
                IntrinsicWidth(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              place.kind.query.capitalize,
                              style: TextStyle(
                                color: Palette.darkGrey.withOpacity(0.8),
                                fontSize: 13,
                              ),
                            ),
                            Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: isFavorite ? Colors.red : Colors.grey,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: width * 0.5,
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
                          const PlaceScoreWidget(),
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
                ),
              ],
            ),
            GestureDetector(
              child: const Icon(Icons.arrow_forward_ios),
              onTap: () => context.push(
                Routes.placeDetailsPage,
                extra: place,
              ),
            ),
            const SizedBox(width: 1),
          ],
        ),
      ),
    );
  }
}
