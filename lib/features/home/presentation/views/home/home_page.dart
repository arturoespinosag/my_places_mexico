import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.places != current.places,
        builder: (context, state) {
          final places = state.places;
          return Center(
            child: Container(
              child: state.status == HomeStatus.loading
                  ? const CircularProgressIndicator()
                  : ((places.isNotEmpty)
                      ? ListView.builder(
                          itemCount: places.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(places[index].nombre),
                              leading: Text(places[index].latitud),
                            );
                          },
                        )
                      : const Center(
                          child: Text('No se encontro informacion'))),
            ),
          );
        },
      ),
    );
  }
}
