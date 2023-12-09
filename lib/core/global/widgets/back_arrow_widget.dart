import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25,
      left: 25,
      child: Container(
        decoration: BoxDecoration(
          color: Palette.lightGrey.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        width: 35,
        height: 35,
        child: IconButton(
          iconSize: 20,
          onPressed: () {
            context.safePop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Palette.mainBlue,
          ),
        ),
      ),
    );
  }
}
