import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/model/trailer.dart';
import 'package:movie_app_flutter/repository/api_repository.dart';

part 'trailer_event.dart';
part 'trailer_state.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  TrailerBloc() : super(TrailerState.defaultState());
  TrailerState get initialState => TrailerState.defaultState();
  ApiRepository _repository = ApiRepository();

  @override
  Stream<TrailerState> mapEventToState(
    TrailerEvent event,
  ) async* {
    if (event is GetTrailers) yield* getMoviesTrailer(event);
  }

  Stream<TrailerState> getMoviesTrailer(GetTrailers event) async* {
    try {
      final response = await _repository.getTrailer(event.id);
      yield state.copyWith(trailer: response.trailers);
    } catch (error) {
      print(error);
    }
  }
}
