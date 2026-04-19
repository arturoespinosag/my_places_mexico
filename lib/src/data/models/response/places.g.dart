// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Places _$PlacesFromJson(Map<String, dynamic> json) => _Places(
  places: (json['places'] as List<dynamic>)
      .map((e) => Place.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PlacesToJson(_Places instance) => <String, dynamic>{
  'places': instance.places,
};
