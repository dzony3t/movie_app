import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/Data/repository/api_repository.dart';
import 'package:movie_app_flutter/model/movie.dart';

part 'similar_event.dart';
part 'similar_state.dart';

class SimilarBloc extends Bloc<SimilarEvent, SimilarState> {
  SimilarBloc() : super(SimilarState.defaultState());
  SimilarState get initialState => SimilarState.defaultState();
  ApiRepository _repository = ApiRepository();

  @override
  Stream<SimilarState> mapEventToState(
      SimilarEvent event,
      ) async* {
    if (event is GetSimilarMovies) yield* _getSimilarMovies(event);
  }

  Stream<SimilarState> _getSimilarMovies(GetSimilarMovies event) async* {
    try {
      final response = await _repository.getSimilar(event.id);
      yield state.copyWith(similarMovies: response.similar);
    } catch (error) {
      print(error);
    }
  }
}
