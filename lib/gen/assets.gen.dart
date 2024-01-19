/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/location.riv
  String get location => 'assets/animations/location.riv';

  /// File path: assets/animations/magnifier.riv
  String get magnifier => 'assets/animations/magnifier.riv';

  /// List of all assets
  List<String> get values => [location, magnifier];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Circle_Red.png
  AssetGenImage get circleRed =>
      const AssetGenImage('assets/images/Circle_Red.png');

  /// File path: assets/images/Circle_white.png
  AssetGenImage get circleWhite =>
      const AssetGenImage('assets/images/Circle_white.png');

  /// File path: assets/images/Heart_Grey.png
  AssetGenImage get heartGrey =>
      const AssetGenImage('assets/images/Heart_Grey.png');

  /// File path: assets/images/Heart_Red.png
  AssetGenImage get heartRed =>
      const AssetGenImage('assets/images/Heart_Red.png');

  /// File path: assets/images/Heart_WaveEffect.png
  AssetGenImage get heartWaveEffect =>
      const AssetGenImage('assets/images/Heart_WaveEffect.png');

  /// File path: assets/images/no-image.png
  AssetGenImage get noImage =>
      const AssetGenImage('assets/images/no-image.png');

  /// File path: assets/images/tab_bar_bg.jpg
  AssetGenImage get tabBarBg =>
      const AssetGenImage('assets/images/tab_bar_bg.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        circleRed,
        circleWhite,
        heartGrey,
        heartRed,
        heartWaveEffect,
        noImage,
        tabBarBg
      ];
}

class $AssetsPagesGen {
  const $AssetsPagesGen();

  $AssetsPagesHomePageGen get homePage => const $AssetsPagesHomePageGen();
}

class $AssetsPagesHomePageGen {
  const $AssetsPagesHomePageGen();

  /// File path: assets/pages/home_page/car_wash.svg
  String get carWash => 'assets/pages/home_page/car_wash.svg';

  /// File path: assets/pages/home_page/gas_station.svg
  String get gasStation => 'assets/pages/home_page/gas_station.svg';

  /// File path: assets/pages/home_page/groceries.svg
  String get groceries => 'assets/pages/home_page/groceries.svg';

  /// File path: assets/pages/home_page/hotel.svg
  String get hotel => 'assets/pages/home_page/hotel.svg';

  /// File path: assets/pages/home_page/market.svg
  String get market => 'assets/pages/home_page/market.svg';

  /// File path: assets/pages/home_page/restaurant.svg
  String get restaurant => 'assets/pages/home_page/restaurant.svg';

  /// File path: assets/pages/home_page/school.svg
  String get school => 'assets/pages/home_page/school.svg';

  /// File path: assets/pages/home_page/stationery.svg
  String get stationery => 'assets/pages/home_page/stationery.svg';

  /// List of all assets
  List<String> get values => [
        carWash,
        gasStation,
        groceries,
        hotel,
        market,
        restaurant,
        school,
        stationery
      ];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsPagesGen pages = $AssetsPagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
