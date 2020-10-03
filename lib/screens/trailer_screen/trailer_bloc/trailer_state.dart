part of 'trailer_bloc.dart';

class TrailerState extends Equatable {
  final List<Trailer> trailer;

  TrailerState({this.trailer});

  factory TrailerState.defaultState() => TrailerState(trailer: []);

  @override
  List<Object> get props => [trailer];

  TrailerState copyWith({List<Trailer> trailer}) {
    return TrailerState(trailer: trailer ?? this.trailer);
  }
}
