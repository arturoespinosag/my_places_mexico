// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'places.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Places {

 List<Place> get places;
/// Create a copy of Places
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlacesCopyWith<Places> get copyWith => _$PlacesCopyWithImpl<Places>(this as Places, _$identity);

  /// Serializes this Places to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Places&&const DeepCollectionEquality().equals(other.places, places));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(places));

@override
String toString() {
  return 'Places(places: $places)';
}


}

/// @nodoc
abstract mixin class $PlacesCopyWith<$Res>  {
  factory $PlacesCopyWith(Places value, $Res Function(Places) _then) = _$PlacesCopyWithImpl;
@useResult
$Res call({
 List<Place> places
});




}
/// @nodoc
class _$PlacesCopyWithImpl<$Res>
    implements $PlacesCopyWith<$Res> {
  _$PlacesCopyWithImpl(this._self, this._then);

  final Places _self;
  final $Res Function(Places) _then;

/// Create a copy of Places
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? places = null,}) {
  return _then(_self.copyWith(
places: null == places ? _self.places : places // ignore: cast_nullable_to_non_nullable
as List<Place>,
  ));
}

}


/// Adds pattern-matching-related methods to [Places].
extension PlacesPatterns on Places {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Places value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Places() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Places value)  $default,){
final _that = this;
switch (_that) {
case _Places():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Places value)?  $default,){
final _that = this;
switch (_that) {
case _Places() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Place> places)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Places() when $default != null:
return $default(_that.places);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Place> places)  $default,) {final _that = this;
switch (_that) {
case _Places():
return $default(_that.places);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Place> places)?  $default,) {final _that = this;
switch (_that) {
case _Places() when $default != null:
return $default(_that.places);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Places implements Places {
   _Places({required final  List<Place> places}): _places = places;
  factory _Places.fromJson(Map<String, dynamic> json) => _$PlacesFromJson(json);

 final  List<Place> _places;
@override List<Place> get places {
  if (_places is EqualUnmodifiableListView) return _places;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_places);
}


/// Create a copy of Places
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlacesCopyWith<_Places> get copyWith => __$PlacesCopyWithImpl<_Places>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlacesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Places&&const DeepCollectionEquality().equals(other._places, _places));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_places));

@override
String toString() {
  return 'Places(places: $places)';
}


}

/// @nodoc
abstract mixin class _$PlacesCopyWith<$Res> implements $PlacesCopyWith<$Res> {
  factory _$PlacesCopyWith(_Places value, $Res Function(_Places) _then) = __$PlacesCopyWithImpl;
@override @useResult
$Res call({
 List<Place> places
});




}
/// @nodoc
class __$PlacesCopyWithImpl<$Res>
    implements _$PlacesCopyWith<$Res> {
  __$PlacesCopyWithImpl(this._self, this._then);

  final _Places _self;
  final $Res Function(_Places) _then;

/// Create a copy of Places
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? places = null,}) {
  return _then(_Places(
places: null == places ? _self._places : places // ignore: cast_nullable_to_non_nullable
as List<Place>,
  ));
}


}

// dart format on
