import 'package:flutter/material.dart';

class AnimatedIconLoader extends StatefulWidget {
  const AnimatedIconLoader({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  State<AnimatedIconLoader> createState() => _AnimatedIconLoaderState();
}

class _AnimatedIconLoaderState extends State<AnimatedIconLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: const Duration(
          milliseconds: 2500,
        ))
      ..forward()
      ..addListener(() {
        if (_controller.isCompleted) {
          _controller.repeat();
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _controller.value,
            child: Icon(
              widget.icon,
              color: Colors.black,
              size: 100,
            ),
          );
        });
  }
}
