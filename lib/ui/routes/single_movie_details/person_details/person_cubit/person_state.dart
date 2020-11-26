part of 'person_cubit.dart';

class PersonState extends Equatable {
  const PersonState({this.persons});
  final Results persons;

  factory PersonState.defaultState() => PersonState();

  @override
  List<Object> get props => [persons];

  PersonState copyWith({persons}) {
    return PersonState(persons: persons ?? this.persons);
  }
}
