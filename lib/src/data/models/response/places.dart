import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myplaces_mexico/src/src.dart';

part 'places.freezed.dart';
part 'places.g.dart';

@freezed
class Places with _$Places {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Places({
    required List<Place> places,
  }) = _Places;

  factory Places.fromJson(Map<String, dynamic> json) => _$PlacesFromJson(json);
}
