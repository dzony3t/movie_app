part of 'similar_bloc.dart';

class SimilarState extends Equatable {
  final List<Movie> similarMovies;

  SimilarState({this.similarMovies});

  factory SimilarState.defaultState() => SimilarState(similarMovies: []);

  @override
  List<Object> get props => [similarMovies];

  SimilarState copyWith({List<Movie> similarMovies}) {
    return SimilarState(similarMovies: similarMovies ?? this.similarMovies);
  }
}
