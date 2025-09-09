import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_details_bloc.freezed.dart';
part 'place_details_event.dart';
part 'place_details_state.dart';

class PlaceDetailsBloc extends Bloc<PlaceDetailsEvent, PlaceDetailsState> {
  PlaceDetailsBloc() : super(const _Initial()) {
    on<PlaceDetailsEvent>((event, emit) {
      // TODO(arturo): implement event handler
    });
  }
}
