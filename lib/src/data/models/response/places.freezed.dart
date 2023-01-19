// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'places.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Places _$PlacesFromJson(Map<String, dynamic> json) {
  return _Places.fromJson(json);
}

/// @nodoc
mixin _$Places {
  List<Place> get places => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacesCopyWith<Places> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesCopyWith<$Res> {
  factory $PlacesCopyWith(Places value, $Res Function(Places) then) =
      _$PlacesCopyWithImpl<$Res, Places>;
  @useResult
  $Res call({List<Place> places});
}

/// @nodoc
class _$PlacesCopyWithImpl<$Res, $Val extends Places>
    implements $PlacesCopyWith<$Res> {
  _$PlacesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
  }) {
    return _then(_value.copyWith(
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlacesCopyWith<$Res> implements $PlacesCopyWith<$Res> {
  factory _$$_PlacesCopyWith(_$_Places value, $Res Function(_$_Places) then) =
      __$$_PlacesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Place> places});
}

/// @nodoc
class __$$_PlacesCopyWithImpl<$Res>
    extends _$PlacesCopyWithImpl<$Res, _$_Places>
    implements _$$_PlacesCopyWith<$Res> {
  __$$_PlacesCopyWithImpl(_$_Places _value, $Res Function(_$_Places) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
  }) {
    return _then(_$_Places(
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Places implements _Places {
  _$_Places({required final List<Place> places}) : _places = places;

  factory _$_Places.fromJson(Map<String, dynamic> json) =>
      _$$_PlacesFromJson(json);

  final List<Place> _places;
  @override
  List<Place> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'Places(places: $places)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Places &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_places));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlacesCopyWith<_$_Places> get copyWith =>
      __$$_PlacesCopyWithImpl<_$_Places>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlacesToJson(
      this,
    );
  }
}

abstract class _Places implements Places {
  factory _Places({required final List<Place> places}) = _$_Places;

  factory _Places.fromJson(Map<String, dynamic> json) = _$_Places.fromJson;

  @override
  List<Place> get places;
  @override
  @JsonKey(ignore: true)
  _$$_PlacesCopyWith<_$_Places> get copyWith =>
      throw _privateConstructorUsedError;
}
