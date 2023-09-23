import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        placesUseCase: PlacesUseCaseImpl(
          RepositoryProvider.of(context),
          RepositoryProvider.of(context),
        ),
      )..add(
          const HomeEvent.fetchNearbyPlaces(
              'restaurante', '19.257463808899686,-99.17140684609475', '1000'),
        ),
      child: const HomeView(),
    );
  }
}
