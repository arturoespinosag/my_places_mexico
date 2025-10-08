import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedIconLoader extends StatefulWidget {
  const AnimatedIconLoader({
    required this.icon,
    super.key,
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
    unawaited(init());
    super.initState();
  }

  Future<void> init() async {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );
    await _controller.forward();
    _controller.addListener(() async {
      if (_controller.isCompleted) {
        await _controller.repeat();
      }
    });
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
      },
    );
  }
}
