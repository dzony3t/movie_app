part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  MoviesState({this.movies});
  final List<Movie> movies;


  factory MoviesState.defaultState() =>
      MoviesState(movies: []);

  @override
  List<Object> get props => [movies];

  MoviesState copyWith({List<Movie> movies}) {
    return MoviesState(
      movies: movies ?? this.movies,);
  }
}
