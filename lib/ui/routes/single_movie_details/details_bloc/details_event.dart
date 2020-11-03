part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
}

class GetDetails extends DetailsEvent {
  final int id;
  GetDetails({this.id});
  @override
  List<Object> get props => [id];
//  TODO przekazac cale movie zamiast id
}

