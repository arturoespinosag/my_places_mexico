import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

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
          return AnnotatedRegion(
            value: systemUiMain,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  bottom: AppBar(
                    toolbarHeight: 80,
                    title: const Padding(
                      padding: edgeInsetsSymetricH10,
                      child: _SearchBarWidget(),
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
                      p.isList != c.isList ||
                      p.places != c.places,
                  builder: (context, state) {
                    final places = state.places;
                    final status = state.status;
                    final isLoading = status == HomeStatus.loading;
                    final isList = state.isList;
                    return isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: edgeInsetsAll35,
                                  child: Text(
                                    'Lugares cercanos',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: edgeInsetsSymetricH30,
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Palette.lightGrey,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(children: [
                                        _ListIconWidget(
                                          icon: Icons.expand_sharp,
                                          isSelected: !isList,
                                          onTap: isList
                                              ? () =>
                                                  context.read<HomeBloc>().add(
                                                        const HomeEvent
                                                            .switchHomeList(
                                                          isList: false,
                                                        ),
                                                      )
                                              : () {},
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        _ListIconWidget(
                                          icon: Icons.list_sharp,
                                          isSelected: isList,
                                          onTap: !isList
                                              ? () =>
                                                  context.read<HomeBloc>().add(
                                                        const HomeEvent
                                                            .switchHomeList(
                                                          isList: true,
                                                        ),
                                                      )
                                              : () {},
                                        ),
                                      ]),
                                      _RefreshButton(
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      edgeInsetsSymetricH16.copyWith(top: 20),
                                  child: Column(
                                    children: [
                                      ...List.generate(
                                        places.length,
                                        (index) => _PlaceItemWidget(
                                          place: places[index],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
                bottomNavigationBar: NavigationBar(
                  indicatorShape: const RoundedRectangleBorder(
                      borderRadius: borderRadius40),
                  backgroundColor: Colors.white,
                  elevation: 10,
                  selectedIndex: 0,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.home),
                      label: 'Home',
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
        });
  }
}

class _RefreshButton extends StatelessWidget {
  const _RefreshButton({
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      child: Icon(Icons.refresh_outlined),
    );
  }
}

class _ListIconWidget extends StatelessWidget {
  const _ListIconWidget({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Palette.mainBlue : Colors.white,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          size: 30,
          color: isSelected ? Palette.mainBlue : Colors.grey,
        ),
      ),
    );
  }
}

class _PlaceItemWidget extends StatelessWidget {
  const _PlaceItemWidget({
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.restaurant),
      title: Text(place.nombre.toTitleCase()),
    );
  }
}

class _SearchBarWidget extends StatefulWidget {
  const _SearchBarWidget();

  @override
  State<_SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<_SearchBarWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 45,
      width: width * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius4,
      ),
      child: TextField(
        onChanged: (text) {},
        controller: _controller,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
