import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';

class PlaceScoreWidget extends StatelessWidget {
  const PlaceScoreWidget({super.key});

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
