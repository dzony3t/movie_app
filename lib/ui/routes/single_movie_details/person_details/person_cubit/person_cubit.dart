import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/Data/repository/api_repository.dart';
import 'package:movie_app_flutter/app/configure_getIt.dart';
import 'package:movie_app_flutter/model/person.dart';

part 'person_state.dart';


class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(PersonState.defaultState());

  void getPerson({id}) async {

    final response =  await  getIt.get<ApiRepository>().getPersonData(id);
    emit(state.copyWith(
      persons: response.person,
    ));
  }
}