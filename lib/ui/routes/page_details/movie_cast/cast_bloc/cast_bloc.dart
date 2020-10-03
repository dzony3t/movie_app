import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/Data/repository/api_repository.dart';
import 'package:movie_app_flutter/model/film_cast.dart';
part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc() : super(CastState.defaultState());
  CastState get initialState => CastState.defaultState();
  ApiRepository _repository = ApiRepository();
  @override
  Stream<CastState> mapEventToState(
      CastEvent event,
      ) async* {
    if (event is GetCastEvent) yield* _getCast(event);
  }

  Stream<CastState> _getCast(GetCastEvent event) async* {
    try {
      final response = await _repository.getCasts(event.id);
      yield state.copyWith(movieCast: response.movieCast);
    } catch (error) {
      print(error);
    }
  }
}
