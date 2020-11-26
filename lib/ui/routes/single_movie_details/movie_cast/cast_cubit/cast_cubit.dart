

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/Data/repository/api_repository.dart';
import 'package:movie_app_flutter/app/configure_getIt.dart';
import 'package:movie_app_flutter/model/film_cast.dart';
part 'cast_state.dart';



class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastState.defaultState());

  void getMoviesCast({id}) async {

    final response =  await  getIt.get<ApiRepository>().getCasts(id);
    emit(state.copyWith(
      movieCast: response.movieCast,
    ));
  }
}