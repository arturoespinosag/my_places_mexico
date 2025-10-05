import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

class PlaceDetailsBottomSheet extends StatelessWidget {
  const PlaceDetailsBottomSheet._({
    required this.place,
  });

  final PlaceWithDistance place;

  static Future<void> show(
    BuildContext context, {
    required PlaceWithDistance place,
  }) =>
      showModalBottomSheet<void>(
        isScrollControlled: true,
        barrierColor: Colors.transparent,
        context: context,
        builder: (_) => PlaceDetailsBottomSheet._(
          place: place,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: height * 0.3,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            border: Border.all(),
          ),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Row(
                  spacing: 10,
                  children: [
                    Image.asset(
                      height: 60,
                      place.kind.path,
                    ),
                    Expanded(
                      child: Text(
                        place.nombre.toTitleCase(),
                        style: theme.textTheme.titleLarge!
                            .copyWith(fontWeight: FontWeight.w700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Text(
                  place.address,
                  maxLines: 2,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Llamar')),
                  TextButton(onPressed: () {}, child: const Text('Navegar')),
                  TextButton(onPressed: () {}, child: const Text('Compartir')),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
