import 'package:flutter/material.dart';

class PlaceIconWidget extends StatelessWidget {
  const PlaceIconWidget({required this.icon, super.key});

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color.fromARGB(255, 213, 222, 238),
      ),
      width: 50,
      height: 50,
      child: icon,
    );
  }
}
