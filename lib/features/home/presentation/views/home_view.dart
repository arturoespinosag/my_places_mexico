import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

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
              body: navigationViews[selectedIndex],
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

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    final places = context.read<HomeBloc>().state.places;

    final initialLocation = places.isNotEmpty
        ? LatLng(
            double.tryParse(places[0].latitud) ?? 19.432366683023716,
            double.tryParse(places[0].longitud) ?? -99.13323364074559,
          )
        : const LatLng(19.432366683023716, -99.13323364074559);
    return BlocSelector<HomeBloc, HomeState, PlaceWithDistance?>(
      selector: (state) {
        return state.mapSelectedPlace;
      },
      builder: (context, mapSelectedPlace) {
        final id = mapSelectedPlace?.id ?? '';
        final markers = places.map((place) {
          final icon = place.id == id
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
              : BitmapDescriptor.defaultMarker;
          return Marker(
            icon: icon,
            markerId: MarkerId(
              place.id,
            ),
            position: LatLng(
                double.parse(place.latitud), double.parse(place.longitud)),
            infoWindow: InfoWindow(
              title: place.nombre.toTitleCase(),
            ),
            onTap: () => context.read<HomeBloc>().add(
                  HomeEvent.mapSelectedPlaceChanged(
                    placeId: place.id,
                  ),
                ),
          );
        }).toSet();
        return GoogleMap(
          myLocationEnabled: true,
          trafficEnabled: true,
          circles: {
            // TODO(all): add as many circles as opened places are and remove the circle of selected place
            Circle(
              circleId: const CircleId('value'),
              visible: true,
              center: LatLng(
                  double.tryParse(mapSelectedPlace?.latitud ?? '') ?? 0,
                  double.tryParse(mapSelectedPlace?.longitud ?? '') ?? 0),
              radius: 10,
              // TODO(all): animate radius
              fillColor: Colors.blue.withOpacity(0.5),
              strokeColor: Colors.blue.withOpacity(0.5),
            )
          },
          mapType: MapType.normal,
          rotateGesturesEnabled: true,
          scrollGesturesEnabled: true,
          initialCameraPosition:
              CameraPosition(target: initialLocation, zoom: 15),
          markers: markers,
        );
      },
    );
  }
}
