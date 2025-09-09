// ignoring temporarily, JsonKey will be used
// ignore_for_file: non_constant_identifier_names
// TODO(arturo): use JsonKey to avoid this ignore

import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
class Place with _$Place {
  @JsonSerializable(fieldRename: FieldRename.pascal, includeIfNull: false)
  factory Place({
    required String cLEE,
    required String id,
    required String nombre,
    required String razon_social,
    required String clase_actividad,
    required String estrato,
    required String tipo_vialidad,
    required String calle,
    required String num_Exterior,
    required String num_Interior,
    required String colonia,
    required String cP,
    required String ubicacion,
    required String telefono,
    required String correo_e,
    required String sitio_internet,
    required String tipo,
    required String longitud,
    required String latitud,
    required String centroComercial,
    required String tipoCentroComercial,
    required String numLocal,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
