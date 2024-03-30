// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlacesImpl _$$PlacesImplFromJson(Map<String, dynamic> json) => _$PlacesImpl(
      places: (json['places'] as List<dynamic>)
          .map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlacesImplToJson(_$PlacesImpl instance) =>
    <String, dynamic>{
      'places': instance.places,
    };
