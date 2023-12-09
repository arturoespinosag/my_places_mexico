import 'package:flutter/material.dart';
import 'package:myplaces_mexico/gen/assets.gen.dart';

class AnimatedHeartWidget extends StatefulWidget {
  const AnimatedHeartWidget({
    super.key,
    this.iconRateSize = 1,
  });

  final double iconRateSize;

  @override
  State<AnimatedHeartWidget> createState() => _AnimatedHeartWidgetState();
}

class _AnimatedHeartWidgetState extends State<AnimatedHeartWidget>
    with TickerProviderStateMixin {
  bool isFavorite = false;
  late AnimationController _controller;
  late Animation<double> _greyHeartSize;
  late Animation<double> _redCircleSize;
  late Animation<double> _whiteCircleSize;
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

    // Tween size from 148 to 0, on a 0.0 to 0.15 interval using an easeInOut curve
    _greyHeartSize = Tween(begin: 18.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.15, curve: Curves.easeInOut),
      ),
    );

    _redCircleSize = Tween(begin: 0.0, end: 37.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    // Tween size from 0 to 315 on a 0.1 to 0.25 interval using an easeInOut curve
    _whiteCircleSize = Tween(begin: 0.0, end: 39.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.25, curve: Curves.easeInOut),
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
          weight: 20.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 24.32, end: 9.73)
              .chain(CurveTween(curve: const Cubic(0.71, -0.01, 1.0, 1.0))),
          weight: 20.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 9.73, end: 18.0)
              .chain(CurveTween(curve: Curves.elasticOut)),
          weight: 60.0,
        ),
      ],
    ).animate((CurvedAnimation(
        parent: _controller, curve: const Interval(0.1, 1.0))));

    _waveEffectOpacity = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          weight: 60.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 1.0, end: 0.0),
          weight: 40.0,
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
        onTap: () async {
          setState(() {
            isFavorite = !isFavorite;
          });
          _controller.reset();
          _controller.forward();
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return SizedBox(
                    height: _redCircleSize.value * widget.iconRateSize,
                    width: _redCircleSize.value * widget.iconRateSize,
                    child: Assets.images.circleRed.image(),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return SizedBox(
                      height: _whiteCircleSize.value * widget.iconRateSize,
                      width: _whiteCircleSize.value * widget.iconRateSize,
                      child: Assets.images.circleWhite.image(),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.center,
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
              alignment: Alignment.center,
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return SizedBox(
                      height: _redHeartSize.value * widget.iconRateSize,
                      width: _redHeartSize.value * widget.iconRateSize,
                      child: isFavorite
                          ? Assets.images.heartRed.image()
                          : Assets.images.heartGrey.image(),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return SizedBox(
                      height: _greyHeartSize.value * widget.iconRateSize,
                      width: _greyHeartSize.value * widget.iconRateSize,
                      child: isFavorite
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
