import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/Data/repository/api_repository.dart';
import 'package:movie_app_flutter/model/person.dart';

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
    if (event is GetPersonsEvent) yield* _getPersonData(event);
  }

  Stream<PersonState> _getPersonData(GetPersonsEvent event) async* {
    try {
      final response = await _repository.getPersonData(event.id);
      yield state.copyWith(persons: response.person);
    } catch (error) {
      print(error);
    }
  }
}
