// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Places _$$_PlacesFromJson(Map<String, dynamic> json) => _$_Places(
      places: (json['places'] as List<dynamic>)
          .map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlacesToJson(_$_Places instance) => <String, dynamic>{
      'places': instance.places,
    };
