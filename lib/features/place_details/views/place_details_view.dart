import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/core/global/widgets/action_button.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({
    super.key,
    required this.place,
  });

  final PlaceWithDistance place;

  @override
  Widget build(BuildContext context) {
    final street = place.calle.toTitleCase();
    final cp = place.cP.isEmpty ? '' : 'C.P. ${place.cP}';
    final colony = place.colonia.toTitleCase();
    final intNumber =
        place.num_Interior.isEmpty ? '' : ' int. ${place.num_Interior}';
    const style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );
    final address = '$street ${place.num_Exterior}$intNumber, $colony, $cp.';
    final width = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const DetailsHeaderWidget(),
              Padding(
                padding: edgeInsetsSymmetricH20,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    BlocSelector<FavoritesBloc, FavoritesState,
                        List<PlaceWithDistance>>(
                      selector: (state) {
                        return state.allFavoritePlaces;
                      },
                      builder: (context, favoritePlaces) {
                        final isFavorite =
                            favoritePlaces.any((e) => e.id == place.id);
                        return DetailsTitleWidget(
                          isFavorite: isFavorite,
                          place: place,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    DetailsRowWidget(
                      leftWidget: Text(
                        place.kind.query.toTitleCase(),
                        style: style,
                      ),
                      rightWidget: const PlaceScoreWidget(),
                    ),
                    const SizedBox(height: 20),
                    const DetailsRowWidget(
                      leftWidget: Text(
                        'Horario',
                        style: style,
                      ),
                      rightWidget: Text(
                        'Lunes - Viernes 9 - 18\n\nSábado 9 - 14\n\nDomingo Cerrado',
                        textAlign: TextAlign.end,
                        style: style,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                    DetailsRowWidget(
                      leftWidget: const Icon(Icons.location_on_outlined),
                      rightWidget: SizedBox(
                        width: width * 0.7,
                        child: Text(
                          address,
                          textAlign: TextAlign.start,
                          style: style,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DetailsRowWidget(
                      leftWidget: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      rightWidget: SizedBox(
                        width: width * 0.7,
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Roxana',
                              style: style.copyWith(
                                color: Colors.red,
                              ),
                            ),
                            TextSpan(
                              text: ', ',
                              style: style.copyWith(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Isaac',
                              style: style.copyWith(
                                color: Colors.red,
                              ),
                            ),
                            TextSpan(
                              text: ' y otros ',
                              style: style.copyWith(color: Colors.black),
                            ),
                            TextSpan(
                              text: '2 amigos',
                              style: style.copyWith(
                                color: Colors.red,
                              ),
                            ),
                            TextSpan(
                              text: ' agregaron este lugar como favorito.',
                              style: style.copyWith(color: Colors.black),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ActionButton(
                      text: 'Llévame ahí',
                      height: 50,
                      textColor: Colors.white,
                      fontSize: 18,
                      onTap: () => navigateTo(place.latitud, place.longitud),
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void navigateTo(String lat, String lng) async {
  final uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch ${uri.toString()}';
  }
}

class DetailsRowWidget extends StatelessWidget {
  const DetailsRowWidget({
    super.key,
    required this.leftWidget,
    required this.rightWidget,
  });

  final Widget leftWidget;
  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leftWidget,
        rightWidget,
      ],
    );
  }
}

class DetailsTitleWidget extends StatelessWidget {
  const DetailsTitleWidget({
    super.key,
    required this.isFavorite,
    required this.place,
  });

  final bool isFavorite;

  final PlaceWithDistance place;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(getIcon(place.kind)),
            const SizedBox(width: 15),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.57,
              child: Text(
                place.nombre.toTitleCase(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.share),
            const SizedBox(width: 20),
            AnimatedHeartWidget(
              iconRateSize: 1.5,
              isFavorite: isFavorite,
              onTap: () {
                final bloc = context.read<FavoritesBloc>();
                isFavorite
                    ? bloc
                        .add(FavoritesEvent.favoriteRemoved(placeId: place.id))
                    : bloc.add(FavoritesEvent.favoriteAdded(place: place));
              },
            ),
          ],
        )
      ],
    );
  }
}
