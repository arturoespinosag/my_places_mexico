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
    return InkWell(
      onTap: () => context.push(
        Routes.placeDetailsPage,
        extra: place,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const PlaceImageWidget(),
                  const SizedBox(width: 20),
                  IntrinsicWidth(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                Icons.favorite,
                                color: isFavorite
                                    ? Colors.red
                                    : Colors.grey.shade400,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: width * 0.5,
                          child: Text(
                            place.nombre.toTitleCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Palette.spaceBlue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
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
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios),
              const SizedBox(width: 1),
            ],
          ),
        ),
      ),
    );
  }
}
