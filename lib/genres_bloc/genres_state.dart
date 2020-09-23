part of 'genres_bloc.dart';

class GenresState extends Equatable {

  GenresState({this.genres});
  final List<Genres> genres;

  factory GenresState.defaultState() => GenresState(genres: []);

  @override
  List<Object> get props => [genres];

  GenresState copyWith({List<Genres> genres}) {
    return GenresState(genres: genres ?? this.genres);
  }
}