part of 'details_bloc.dart';

class DetailsState extends Equatable {
  DetailsState({this.movie});
  final Details movie;


  factory DetailsState.defaultState() =>
      DetailsState();

  @override
  List<Object> get props => [movie];

  DetailsState copyWith({movie}) {
    return DetailsState(
        movie: movie?? this.movie);
  }
}
