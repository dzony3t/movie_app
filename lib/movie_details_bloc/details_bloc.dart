import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/model/details.dart';
import 'package:movie_app_flutter/repository/api_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsState());
  DetailsState get initialState => DetailsState.defaultState();
  ApiRepository _repository = ApiRepository();
  @override
  Stream<DetailsState> mapEventToState(
    DetailsEvent event,
  ) async* {
    if (event is GetDetails) yield* _getMoviesDetailsById(event);
  }

  Stream<DetailsState> _getMoviesDetailsById(GetDetails event) async* {
    try {
      final response = await _repository.getMoviesDetailsById(event.id);
      yield state.copyWith(movie: response.movie);
    } catch (error) {
      print(error);
    }
  }
}
