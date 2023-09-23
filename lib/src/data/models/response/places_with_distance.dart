import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myplaces_mexico/src/src.dart';

part 'places_with_distance.freezed.dart';

@freezed
class PlacesWithDistance with _$PlacesWithDistance {
  factory PlacesWithDistance({
    required List<PlaceWithDistance> placesWithDistance,
  }) = _PlacesWithDistance;
}
