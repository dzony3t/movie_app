import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/Data/repository/api_repository.dart';
import 'package:movie_app_flutter/app/configure_getIt.dart';
import 'package:movie_app_flutter/model/movie.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.defaultState());


  @override
  Stream<SearchState> mapEventToState(
      SearchEvent event,
      ) async* {
    if (event is SearchMoviesEvent) yield* _getSearchingMovies(event);
  }

  Stream<SearchState> _getSearchingMovies(SearchMoviesEvent event) async* {
    try {
      final response = await getIt.get<ApiRepository>().searchMovies(event.query);
      yield state.copyWith(results: response.search);
    } catch (error) {
      print(error);
    }
  }
}
