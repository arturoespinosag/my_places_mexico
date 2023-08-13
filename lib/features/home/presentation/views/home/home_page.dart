import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        placesRepository: RepositoryProvider.of(context),
      )..add(
          const HomeEvent.fetchNearbyPlaces(
              'restaurante', '19.257463808899686,-99.17140684609475', '1000'),
        ),
      child: const _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.places != current.places ||
            previous.isList != current.isList,
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.list),
              onPressed: () {
                //add event to switch list to card
                context.read<HomeBloc>().add(
                      const HomeEvent.switchHomeList(),
                    );
              },
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status ||
                  previous.places != current.places ||
                  previous.isList != current.isList,
              builder: (context, state) {
                final places = state.places;
                return SafeArea(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        pinned: false,
                        snap: false,
                        floating: true,
                        expandedHeight: 160.0,
                        flexibleSpace: FlexibleSpaceBar(
                          title: const Text('Mexico places'),
                          background: Image.asset(
                            'assets/images/tab_bar_bg.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          List.generate(places.length + 2, (index) {
                            if (index == 0) {
                              return CustomCard(
                                title: Text(
                                  'This is going to be the search bar',
                                  style: FontStyles.regular.copyWith(
                                      color: Colors.white, fontSize: 35),
                                ),
                                firstColor: Colors.cyan,
                                secondColor: Colors.amber,
                              );
                            }
                            if (index == 1) {
                              return const CategoriesList();
                            }
                            final place = places[index - 2];
                            return GestureDetector(
                              onTap: () => show(context, place),
                              child: AnimatedCrossFade(
                                firstChild: CustomCard(
                                  firstColor: Colors.red,
                                  secondColor: Colors.blue,
                                  title: Text(
                                    places[index - 2].nombre.toTitleCase(),
                                    style: FontStyles.title,
                                  ),
                                  image: 'assets/images/no-image.png',
                                ),
                                secondChild: CustomCard(
                                  title: Text(
                                    places[index - 2].nombre.toTitleCase(),
                                    style: FontStyles.regular.copyWith(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  firstColor: Colors.grey,
                                  height: 100,
                                ),
                                duration: const Duration(milliseconds: 400),
                                crossFadeState: state.isList
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            // bottomNavigationBar: NavigationBar(),
          );
        });
  }
}
