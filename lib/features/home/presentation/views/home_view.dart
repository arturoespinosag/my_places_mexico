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
      child: BlocSelector<HomeBloc, HomeState, int>(
        selector: (state) {
          return state.selectedIndex;
        },
        builder: (context, selectedIndex) {
          return SafeArea(
            child: Scaffold(
              appBar: selectedIndex == 0
                  ? AppBar(
                      bottom: AppBar(
                        toolbarHeight: 80,
                        title: const Padding(
                          padding: edgeInsetsSymmetricH10,
                          child: SearchBarWidget(),
                        ),
                      ),
                      title: Padding(
                        padding: edgeInsetsSymmetricH14.copyWith(
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
                          padding: edgeInsetsSymmetricH14.copyWith(left: 6),
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
                    )
                  : null,
              body: IndexedStack(
                index: selectedIndex,
                children: navigationViews,
              ),
              bottomNavigationBar: NavigationBar(
                indicatorShape:
                    const RoundedRectangleBorder(borderRadius: borderRadius40),
                backgroundColor: Colors.white,
                elevation: 10,
                selectedIndex: selectedIndex,
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
                    icon: Icon(Icons.favorite),
                    label: 'Favorites',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                onDestinationSelected: (index) => context.read<HomeBloc>().add(
                      HomeEvent.indexSelected(
                        selectedIndex: index,
                      ),
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final navigationViews = [
  const PlacesView(),
  const MapView(),
  const FavoritesView(),
  const ProfileView(),
];
