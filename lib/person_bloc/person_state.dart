part of 'person_bloc.dart';

class PersonState extends Equatable {
  const PersonState({this.persons});
  final List<Person> persons;

  factory PersonState.defaultState() => PersonState(persons: []);

  @override
  List<Object> get props => [persons];

  PersonState copyWith({List<Person> persons}) {
    return PersonState(persons: persons ?? this.persons);
  }
}
