import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/core/shared/presentation/presentation.dart';
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
            padding: edgeInsetsSymmetricH20,
            child: favoritePlaces.isEmpty
                ? const Center(child: Text('No tienes favoritos'))
                : SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 38),
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: BlocSelector<FavoritesBloc, FavoritesState,
                                PlaceKind?>(
                              selector: (state) {
                                return state.selectedFilter;
                              },
                              builder: (context, selectedFilter) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () => context
                                          .read<FavoritesBloc>()
                                          .add(const FavoritesEvent
                                              .filterSelected()),
                                      child: Text(
                                        'Todos',
                                        style: selectedFilter != null
                                            ? null
                                            : const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    ...List.generate(PlaceKind.values.length,
                                        (index) {
                                      final isSelected =
                                          PlaceKind.values[index] ==
                                              selectedFilter;
                                      final placeKindName = PlaceKind
                                          .values[index].query
                                          .toTitleCase();
                                      return Row(
                                        children: [
                                          // switch the null value to a new style
                                          InkWell(
                                            onTap: () => context
                                                .read<FavoritesBloc>()
                                                .add(
                                                  FavoritesEvent.filterSelected(
                                                    selectedFilter:
                                                        PlaceKind.values[index],
                                                  ),
                                                ),
                                            child: Text(
                                              placeKindName,
                                              style: isSelected
                                                  ? const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                    )
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 20)
                                        ],
                                      );
                                    })
                                  ],
                                );
                              },
                            )),
                        const Divider(
                          height: 30,
                          thickness: 3,
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
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
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
