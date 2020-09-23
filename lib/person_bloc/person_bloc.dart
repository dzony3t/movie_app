import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/model/person.dart';
import 'package:movie_app_flutter/repository/api_repository.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonState.defaultState());
  PersonState get initialState => PersonState.defaultState();
  ApiRepository _repository = ApiRepository();
  @override
  Stream<PersonState> mapEventToState(
    PersonEvent event,
  ) async* {
    if (event is GetPersonsEvent) yield* _getPersonData();
  }

  Stream<PersonState> _getPersonData() async* {
    try {
      final response = await _repository.getPersonData();
//      print(response.movies);
      yield state.copyWith(persons: response.persons);
    } catch (error) {
      print(error);
    }
  }
}
