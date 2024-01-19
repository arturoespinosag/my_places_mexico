import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myplaces_mexico/features/features.dart';
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
          c.favoritePlaces != p.favoritePlaces,
      builder: (context, state) {
        final places = state.places;
        final status = state.status;
        final isLoading = status == HomeStatus.loading;
        final isGettingLocation =
            state.locationStatus == LocationStatus.retrieving;
        final isList = state.isList;
        return Column(
          children: [
            HeaderWidget(
              isList: isList,
            ),
            isLoading
                ? Expanded(
                    child: Center(
                      child: isGettingLocation
                          ? const RiveLocationLoader()
                          : const RiveSearchLoader(),
                    ),
                  )
                : PlacesListWidget(
                    places: places,
                    favoritePlaces: state.favoritePlaces,
                    isList: isList,
                    onRefresh: () async => context
                        .read<HomeBloc>()
                        .add(const HomeEvent.fetchNearbyPlaces()),
                  ),
          ],
        );
      },
    );
  }
}

class RiveSearchLoader extends StatelessWidget {
  const RiveSearchLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: RiveAnimation.asset(
        'assets/animations/magnifier.riv',
      ),
    );
  }
}

class RiveLocationLoader extends StatelessWidget {
  const RiveLocationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150,
      child: RiveAnimation.asset(
        'assets/animations/location.riv',
      ),
    );
  }
}
