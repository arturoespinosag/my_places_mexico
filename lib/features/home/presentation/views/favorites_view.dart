import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/features/home/presentation/widgets/favorite_card.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocSelector<HomeBloc, HomeState, List<PlaceWithDistance>>(
        selector: (state) {
          return state.favoritePlaces;
        },
        builder: (context, favoritePlaces) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: favoritePlaces.isEmpty
                ? const Center(child: Text('No tienes favoritos'))
                : SingleChildScrollView(
                    child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      ...List.generate(
                        favoritePlaces.length,
                        (index) => FavoriteCard(
                          place: favoritePlaces[index],
                          onIconPressed: () => context
                              .read<HomeBloc>()
                              .add(HomeEvent.favoriteRemoved(
                                placeId: favoritePlaces[index].id,
                              )),
                        ),
                      )
                    ],
                  )),
          );
        },
      ),
    );
  }
}
