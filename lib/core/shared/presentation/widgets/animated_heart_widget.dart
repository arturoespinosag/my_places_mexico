import 'package:flutter/material.dart';
import 'package:myplaces_mexico/gen/assets.gen.dart';

class AnimatedHeartWidget extends StatefulWidget {
  const AnimatedHeartWidget({
    super.key,
    this.iconRateSize = 1,
    this.onTap,
    this.isFavorite = false,
  });

  final double iconRateSize;
  final VoidCallback? onTap;
  final bool isFavorite;

  @override
  State<AnimatedHeartWidget> createState() => _AnimatedHeartWidgetState();
}

class _AnimatedHeartWidgetState extends State<AnimatedHeartWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _greyHeartSize;
  late Animation<double> _waveEffectSize;
  late Animation<double> _waveEffectOpacity;
  late Animation<double> _redHeartSize;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    )..forward(from: 1);

    // Tween size from 148 to 0, on a 0.0 to 0.15
    // interval using an easeInOut curve
    _greyHeartSize = Tween<double>(begin: 18, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.15, curve: Curves.easeInOut),
      ),
    );

    // Tween size from 0 to 300 on a 0 to 0.3 interval using an easeInOut curve
    _waveEffectSize = Tween(begin: 13.38, end: 25.54).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeInOut),
      ),
    );

    _redHeartSize = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.6, end: 24.32)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 20,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 24.32, end: 9.73)
              .chain(CurveTween(curve: const Cubic(0.71, -0.01, 1, 1))),
          weight: 20,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 9.73, end: 18)
              .chain(CurveTween(curve: Curves.elasticOut)),
          weight: 60,
        ),
      ],
    ).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.1, 1)));

    _waveEffectOpacity = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0, end: 1),
          weight: 60,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 1, end: 0),
          weight: 40,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeInOut),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Tween size from 148 to 0, on a 0.0 to 0.15 interval using a easeInOut curve

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 38,
      child: GestureDetector(
        onTap: () {
          // setState(() {
          //   isFavorite = !isFavorite;
          // });
          _controller
            ..reset()
            ..forward();

          widget.onTap?.call();
        },
        child: Stack(
          children: [
            Align(
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return SizedBox(
                      height: _waveEffectSize.value * widget.iconRateSize,
                      width: _waveEffectSize.value * widget.iconRateSize,
                      child: Opacity(
                          opacity: _waveEffectOpacity.value,
                          child: Assets.images.heartWaveEffect.image()),
                    );
                  }),
            ),
            Align(
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return SizedBox(
                      height: _redHeartSize.value * widget.iconRateSize,
                      width: _redHeartSize.value * widget.iconRateSize,
                      child: widget.isFavorite
                          ? Assets.images.heartRed.image()
                          : Assets.images.heartGrey.image(),
                    );
                  }),
            ),
            Align(
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return SizedBox(
                      height: _greyHeartSize.value * widget.iconRateSize,
                      width: _greyHeartSize.value * widget.iconRateSize,
                      child: widget.isFavorite
                          ? Assets.images.heartGrey.image()
                          : Assets.images.heartRed.image(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
