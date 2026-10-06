import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:myplaces_mexico/core/shared/shared.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/gen/assets.gen.dart';
import 'package:myplaces_mexico/src/src.dart';
import 'package:rive/rive.dart';

class PlacesView extends StatelessWidget {
  const PlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (p, c) =>
          p.status != c.status ||
          p.locationStatus != c.locationStatus ||
          p.isList != c.isList ||
          p.places != c.places ||
          p.filteredPlaces != c.filteredPlaces,
      builder: (context, state) {
        final status = state.status;
        final places = state.filteredPlaces.isNotEmpty
            ? state.filteredPlaces
            : state.places;
        final isLoading = status == HomeStatus.loading;
        final isGettingLocation =
            state.locationStatus == LocationStatus.retrieving;
        final isList = state.isList;
        return BlocSelector<FavoritesBloc, FavoritesState,
            List<PlaceWithDistance>>(
          selector: (state) {
            return state.allFavoritePlaces;
          },
          builder: (context, allFavoritePlaces) {
            return Padding(
              padding: edgeInsetsSymmetricH20,
              child: Column(
                children: [
                  const HeaderWidget(),
                  if (isLoading)
                    Expanded(
                      child: Center(
                        child: isGettingLocation
                            ? const RiveLocationLoader()
                            : const RiveSearchLoader(),
                      ),
                    )
                  else
                    PlacesListWidget(
                      places: places,
                      favoritePlaces: allFavoritePlaces,
                      isList: isList,
                      onRefresh: () async => context
                          .read<HomeBloc>()
                          .add(const HomeEvent.fetchNearbyPlaces()),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class RiveSearchLoader extends StatelessWidget {
  const RiveSearchLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: _RiveAssetLoader(
        assetPath: Assets.animations.magnifier,
        animationName: 'searching',
      ),
    );
  }
}

class RiveLocationLoader extends StatelessWidget {
  const RiveLocationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: _RiveAssetLoader(
        assetPath: Assets.animations.location,
        animationName: 'map',
      ),
    );
  }
}

class _RiveAssetLoader extends StatefulWidget {
  const _RiveAssetLoader({
    required this.assetPath,
    required this.animationName,
  });

  final String assetPath;
  final String animationName;

  @override
  State<_RiveAssetLoader> createState() => _RiveAssetLoaderState();
}

class _RiveAssetLoaderState extends State<_RiveAssetLoader> {
  File? _file;
  Artboard? _artboard;
  SingleAnimationPainter? _painter;

  @override
  void initState() {
    super.initState();
    unawaited(_loadAnimation());
  }

  @override
  void didUpdateWidget(covariant _RiveAssetLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath ||
        oldWidget.animationName != widget.animationName) {
      _painter?.dispose();
      _artboard?.dispose();
      _file?.dispose();
      _painter = null;
      _artboard = null;
      _file = null;
      unawaited(_loadAnimation());
    }
  }

  Future<void> _loadAnimation() async {
    final file = await File.asset(
      widget.assetPath,
      riveFactory: Factory.flutter,
    );
    if (!mounted || file == null) {
      return;
    }
    final artboard = file.defaultArtboard();
    if (artboard == null) {
      return;
    }
    final painter = SingleAnimationPainter(widget.animationName);

    setState(() {
      _file = file;
      _artboard = artboard;
      _painter = painter;
    });
  }

  @override
  void dispose() {
    _painter?.dispose();
    _artboard?.dispose();
    _file?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final artboard = _artboard;
    final painter = _painter;
    if (artboard == null || painter == null) {
      return const SizedBox.shrink();
    }
    return RiveArtboardWidget(
      artboard: artboard,
      painter: painter,
    );
  }
}
