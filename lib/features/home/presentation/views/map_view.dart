import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myplaces_mexico/core/core.dart';
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
                fillColor: Colors.blue.withValues(alpha: 0.5),
                strokeColor: Colors.blue.withValues(alpha: 0.5),
              )
            },
            mapType: MapType.normal,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            initialCameraPosition:
                CameraPosition(target: initialLocation, zoom: 15),
            markers: markers,
            onMapCreated: (controller) {
              _controller = controller;
            });
      },
    );
  }
}
