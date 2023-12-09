import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiMain,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: AppBar(
              toolbarHeight: 80,
              title: const Padding(
                padding: edgeInsetsSymetricH10,
                child: SearchBarWidget(),
              ),
            ),
            title: Padding(
              padding: edgeInsetsSymetricH14.copyWith(
                right: 0,
              ),
              child: const Text(
                'My Places',
                textAlign: TextAlign.left,
              ),
            ),
            actions: [
              const Icon(Icons.favorite_outline),
              Padding(
                padding: edgeInsetsSymetricH14.copyWith(left: 6),
                child: IconButton(
                  icon: const Icon(
                    Icons.message_outlined,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            backgroundColor: Palette.mainBlue,
            toolbarHeight: 70,
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
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
          ),
          bottomNavigationBar: NavigationBar(
            indicatorShape:
                const RoundedRectangleBorder(borderRadius: borderRadius40),
            backgroundColor: Colors.white,
            elevation: 10,
            selectedIndex: 0,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.map),
                label: 'Map',
              ),
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
            ],
            onDestinationSelected: (value) {},
          ),
        ),
      ),
    );
  }
}
