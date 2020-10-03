part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchMoviesEvent extends SearchEvent {
  final String query;
  SearchMoviesEvent({this.query});
  @override
  List<Object> get props => [query];
}
