part of 'place_details_bloc.dart';

@freezed
class PlaceDetailsEvent with _$PlaceDetailsEvent {
  const factory PlaceDetailsEvent.started() = _Started;
}
