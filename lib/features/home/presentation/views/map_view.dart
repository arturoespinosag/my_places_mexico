import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myplaces_mexico/core/global/widgets/place_details_bottom_sheet.dart';
import 'package:myplaces_mexico/features/features.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late final GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (p, c) {
        return c.currentPosition != null &&
            p.locationStatus != c.locationStatus &&
            c.locationStatus == LocationStatus.retrieved;
      },
      listener: (context, state) => _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              state.currentPosition!.latitude,
              state.currentPosition!.longitude,
            ),
            zoom: 17,
          ),
        ),
      ),
      builder: (context, state) {
        final mapSelectedPlace = state.mapSelectedPlace;
        final places = state.places;
        final initialLocation = places.isNotEmpty
            ? LatLng(
                double.tryParse(places[0].latitud) ?? 19.432366683023716,
                double.tryParse(places[0].longitud) ?? -99.13323364074559,
              )
            : const LatLng(19.432366683023716, -99.13323364074559);
        // final id = mapSelectedPlace?.id ?? '';

        return BlocListener<HomeBloc, HomeState>(
          listenWhen: (p, c) =>
              c.mapSelectedPlace != null &&
              (p.bottomSheetStatus != c.bottomSheetStatus),
          listener: (context, bottomSheetState) async {
            final mapSelectedPlace = bottomSheetState.mapSelectedPlace;
            if (bottomSheetState.bottomSheetStatus == BottomSheetStatus.open) {
              await PlaceDetailsBottomSheet.show(
                context,
                place: mapSelectedPlace!,
              );
            }
          },
          child: Stack(
            children: [
              GoogleMap(
                trafficEnabled: true,
                style: '[{"featureType": "poi.business", '
                    '"stylers": [{"visibility": "off"}]}]',
                circles: {
                  // TODO(all): add as many circles as
                  //opened places are and remove the circle of selected place
                  Circle(
                    circleId: const CircleId('value'),
                    center: LatLng(
                      double.tryParse(mapSelectedPlace?.latitud ?? '') ??
                          19.432366683023716,
                      double.tryParse(mapSelectedPlace?.longitud ?? '') ??
                          -99.13323364074559,
                    ),
                    radius: 10,
                    // TODO(all): animate radius
                    fillColor: Colors.blue.withValues(alpha: 0.5),
                    strokeColor: Colors.blue.withValues(alpha: 0.5),
                  ),
                },
                initialCameraPosition:
                    CameraPosition(target: initialLocation, zoom: 15),
                markers: state.markers,
                onMapCreated: (controller) {
                  _controller = controller;
                },
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.28,
                maxChildSize: 0.28,
                minChildSize: 0.28,
                snap: true,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Supermercado Juárez',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Groceries • Av. Juárez 123, Col. Centro, CDMX',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '1.2 km away',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 16),

                        /// Example action buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(height: 4),
                                const Text('Call'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.navigation,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(height: 4),
                                const Text('Navigate'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(height: 4),
                                const Text('Share'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
