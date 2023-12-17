import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';

class PlacesView extends StatelessWidget {
  const PlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (p, c) =>
          p.status != c.status ||
          p.locationStatus != c.locationStatus ||
          p.isList != c.isList ||
          p.places != c.places,
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
                      child: AnimatedIconLoader(
                        icon: isGettingLocation
                            ? Icons.location_on
                            : Icons.search,
                      ),
                    ),
                  )
                : PlacesListWidget(
                    places: places,
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
