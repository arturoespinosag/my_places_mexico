import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    required this.place,
    super.key,
    this.onIconPressed,
  });

  final PlaceWithDistance place;
  final VoidCallback? onIconPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: SizedBox(
        height: 80,
        child: InkWell(
          onTap: () => context.push(
            Routes.placeDetailsPage,
            extra: place,
          ),
          child: Row(
            children: [
              const SizedBox(width: 40),
              SizedBox(
                width: width * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      place.kind.query.capitalize,
                      style: TextStyle(
                        color: Palette.darkGrey.withValues(alpha: 0.8),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      place.nombre.toTitleCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Palette.spaceBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${'${place.calle} # ${place.num_Exterior},'
                          ' '.toTitleCase()}${place.colonia.toTitleCase()}',
                      style: TextStyle(
                        color: Palette.darkGrey.withValues(alpha: 0.8),
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              InkWell(
                onTap: onIconPressed,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
