part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState({this.results});

  final List<Movie> results;

  factory SearchState.defaultState() => SearchState(results: []);

  @override
  List<Object> get props => [results];

  SearchState copyWith({List<Movie> results}) {
    return SearchState(results: results ?? this.results);
  }
}
