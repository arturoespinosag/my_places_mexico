import 'package:flutter/material.dart';
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
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
          height: height * 0.3,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                border: Border.all()),
            child: const SizedBox(
              height: 100,
              width: double.infinity,
            ),
          )),
    );
  }
}
