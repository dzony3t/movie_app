part of 'cast_cubit.dart';

class CastState extends Equatable {
  const CastState({this.movieCast});
  final List<Cast> movieCast;

  factory CastState.defaultState() => CastState(movieCast: []);

  @override
  List<Object> get props => [movieCast];

  CastState copyWith({List<Cast> movieCast}) {
    return CastState(movieCast: movieCast ?? this.movieCast);
  }
}
