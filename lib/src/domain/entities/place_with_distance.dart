// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myplaces_mexico/src/src.dart';

part 'place_with_distance.freezed.dart';

@freezed
class PlaceWithDistance with _$PlaceWithDistance {
  factory PlaceWithDistance({
    required String id,
    required String nombre,
    required String razon_social,
    required String tipo_vialidad,
    required String calle,
    required String num_Exterior,
    required String num_Interior,
    required String colonia,
    required String cP,
    required String telefono,
    required String longitud,
    required String latitud,
    required double distance,
    required PlaceKind kind,
  }) = _PlaceWithDistance;
}
