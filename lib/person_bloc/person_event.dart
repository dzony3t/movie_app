part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class GetPersonsEvent extends PersonEvent {
  final int id;
  GetPersonsEvent({this.id});
  @override
  List<Object> get props => [id];
}
