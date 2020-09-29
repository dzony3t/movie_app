part of 'trailer_bloc.dart';

abstract class TrailerEvent extends Equatable {
  const TrailerEvent();
}

class GetTrailers extends TrailerEvent {
  final int id;
  GetTrailers({this.id});
  @override
  List<Object> get props => [id];
}
