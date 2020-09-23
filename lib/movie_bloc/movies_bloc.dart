import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/model/movie_api.dart';
import 'package:movie_app_flutter/repository/api_provider.dart';
import 'package:movie_app_flutter/repository/api_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesState.defaultState());
  MoviesState get initialState => MoviesState.defaultState();

  ApiRepository _repository = ApiRepository();

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is GetMovies) yield* getMoviesList(event);
    if (event is GetTrendingMovies) yield* getTrendingMovies();
    if (event is GetUpcomingMovies) yield* getUpcomingMovies();
  }

  Stream<MoviesState> getMoviesList(GetMovies event) async* {
    try {
      final response = await _repository.getMovies(event.id);
      yield state.copyWith(movies: response.movies);
    } catch (error) {
      print(error);
    }
  }

  Stream<MoviesState> getTrendingMovies() async* {
    try {
      final response = await _repository.getTrendingMovies();
      print(response);
      yield state.copyWith(movies: response.movies);
    } catch (error) {
      print(error);
    }
  }

  Stream<MoviesState> getUpcomingMovies() async* {
    try {
      final response = await _repository.getUpcomingMovies();
      print(response);
      yield state.copyWith(movies: response.movies);
    } catch (error) {
      print(error);
    }
  }
}
