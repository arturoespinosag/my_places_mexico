import 'package:flutter/material.dart';

class PlaceImageWidget extends StatelessWidget {
  const PlaceImageWidget({super.key});

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
