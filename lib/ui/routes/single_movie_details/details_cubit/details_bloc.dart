
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/Data/repository/api_repository.dart';
import 'package:movie_app_flutter/model/details.dart';

part 'details_state.dart';
@singleton
class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsState.defaultState());
  ApiRepository _repository = ApiRepository();

  void getDetails({id}) async {
    final response =  await _repository.getMoviesDetailsById(id);
    emit(state.copyWith(
      movie: response.movie,
    ));
  }

}
