part of 'similar_bloc.dart';

abstract class SimilarEvent extends Equatable {
  const SimilarEvent();
}

class GetSimilarMovies extends SimilarEvent {
  final int id;
  GetSimilarMovies({this.id});
  @override
  List<Object> get props => [id];
}
