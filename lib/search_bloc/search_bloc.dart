import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/model/movie_api.dart';
import 'package:movie_app_flutter/repository/api_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState());
  SearchState get initialState => SearchState.defaultState();

  ApiRepository _repository = ApiRepository();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchMoviesEvent) yield* _getSearchingMovies(event);
  }

  Stream<SearchState> _getSearchingMovies(SearchMoviesEvent event) async* {
    try {
      final response = await _repository.searchMovies(event.query);
      print('printuje response$response');
      yield state.copyWith(results: response.search);
      print('printuje response.search${response.search}');
    } catch (error) {
      print(error);
    }
  }
}
