import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/Data/repository/api_repository.dart';
import 'package:movie_app_flutter/model/genres.dart';

part 'genres_event.dart';
part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  GenresBloc() : super(GenresState.defaultState());
  GenresState get initialState => GenresState.defaultState();

  ApiRepository _repository = ApiRepository();

  @override
  Stream<GenresState> mapEventToState(
      GenresEvent event,
      ) async* {
    if (event is GetGenres) yield* getGenres();
  }

  Stream<GenresState> getGenres() async* {
    try {
      final response = await _repository.getGenres();
      yield state.copyWith(genres: response.genres);
    } catch (error) {
      print(error);
      print('cos poszlo nie tak');
    }
  }
}
