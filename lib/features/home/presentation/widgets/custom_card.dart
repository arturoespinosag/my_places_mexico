import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color? secondColor;
  final Color? firstColor;
  final Widget? child;
  final double? height;
  final String? image;
  final Widget title;

  const CustomCard({
    this.firstColor,
    this.child,
    this.height = 300.0,
    this.secondColor,
    required this.title,
    this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          (secondColor != null)
              ? Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: secondColor,
                  ),
                )
              : Container(
                  height: 0.0,
                ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            height: secondColor != null ? height! * 0.6 : height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
                bottomLeft: secondColor != null
                    ? Radius.zero
                    : const Radius.circular(25.0),
                bottomRight: secondColor != null
                    ? Radius.zero
                    : const Radius.circular(25.0),
              ),
              color: firstColor,
            ),
            child: child,
          ),
          Positioned(
            top: 30,
            left: 40,
            child: image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      image!,
                      width: constraints.maxWidth * 0.4,
                    ),
                  )
                : Container(),
          ),
          Positioned(
            bottom: 35,
            left: 50,
            child: title,
          ),
        ],
      );
    });
  }
}
