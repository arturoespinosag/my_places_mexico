import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';

class DetailsHeaderWidget extends StatelessWidget {
  const DetailsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          color: Colors.green,
        ),
        const BackArrowWidget(),
      ],
    );
  }
}
