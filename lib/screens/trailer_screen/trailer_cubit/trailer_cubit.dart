
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/Data/repository/apiClient.dart';

import 'package:movie_app_flutter/Data/repository/api_repository.dart';
import 'package:movie_app_flutter/app/configure_getIt.dart';
import 'package:movie_app_flutter/model/trailer.dart';

part 'trailer_state.dart';


class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerState.defaultState());

  void getMoviesTrailer({id}) async {

    final response =  await  getIt.get<ApiClient>().getTrailer(id);
    emit(state.copyWith(
      trailer: response.trailers,
    ));
  }
}