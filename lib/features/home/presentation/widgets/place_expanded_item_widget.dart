import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/src/src.dart';

class PlaceExpandedItemWidget extends StatelessWidget {
  const PlaceExpandedItemWidget({
    required this.place,
    super.key,
  });

  final PlaceWithDistance place;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: edgeInsetsSymmetricH20,
      height: 120,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(getIcon(place.kind)),
                  const SizedBox(width: 10),
                  SizedBox(
                      width: width * 0.5,
                      child: Text(
                        place.nombre.toTitleCase(),
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/no-image.png',
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const AnimatedHeartWidget(),
              Text(place.telefono),
            ],
          ),
        ],
      ),
    );
  }
}
