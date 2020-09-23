part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class GetPersonsEvent extends PersonEvent {
  @override
  List<Object> get props => [];
}