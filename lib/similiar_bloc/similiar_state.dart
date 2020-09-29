part of 'similiar_bloc.dart';

class SimilarState extends Equatable {
  final List<SimilarFilm> similarMovies;

  SimilarState({this.similarMovies});

  factory SimilarState.defaultState() => SimilarState(similarMovies: []);

  @override
  List<Object> get props => [similarMovies];

  SimilarState copyWith({List<SimilarFilm> similarMovies}) {
    return SimilarState(similarMovies: similarMovies ?? this.similarMovies);
  }
}
