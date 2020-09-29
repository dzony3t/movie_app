part of 'person_bloc.dart';

class PersonState extends Equatable {
  const PersonState({this.persons});
  final List<Results>persons;

  factory PersonState.defaultState() => PersonState(persons: []);

  @override
  List<Object> get props => [persons];

  PersonState copyWith({List<Results> persons}) {
    return PersonState(persons: persons ?? this.persons);
  }
}
