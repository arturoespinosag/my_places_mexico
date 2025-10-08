import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

class PlaceListTileWidget extends StatelessWidget {
  const PlaceListTileWidget({
    required this.place,
    required this.isFavorite,
    super.key,
  });

  final PlaceWithDistance place;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () async {
        primaryFocus?.unfocus();
        await context.push(
          Routes.placeDetailsPage,
          extra: place,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1,
        color: Colors.white,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  PlaceIconWidget(
                    icon: Icon(place.kind.getIcon(), color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  IntrinsicWidth(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                place.kind.query.capitalize,
                                style: TextStyle(
                                  color:
                                      Palette.darkGrey.withValues(alpha: 0.8),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${place.distance.toStringAsFixed(0)} m',
                          style: TextStyle(
                            color: Palette.darkGrey.withValues(alpha: 0.8),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
              AnimatedHeartWidget(
                iconRateSize: 1.5,
                isFavorite: isFavorite,
                onTap: () {
                  final bloc = context.read<FavoritesBloc>();
                  isFavorite
                      ? bloc.add(
                          FavoritesEvent.favoriteRemoved(placeId: place.id),
                        )
                      : bloc.add(FavoritesEvent.favoriteAdded(place: place));
                },
              ),
              const SizedBox(width: 1),
            ],
          ),
        ),
      ),
    );
  }
}
