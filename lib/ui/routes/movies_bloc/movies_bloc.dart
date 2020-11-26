
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/data/repository/api_repository.dart';
import 'package:movie_app_flutter/model/movie.dart';

part 'movies_state.dart';

@singleton
class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesState.defaultState());
  ApiRepository _repository = ApiRepository();

  void getMovies({id}) async {
    final response =  await _repository.getMovies(id);
    emit(state.copyWith(
      movies: response.movies,
    ));
  }

  void getTrendingMovies() async{
    final response = await _repository.getTrendingMovies();
    emit(state.copyWith(
      movies: response.movies,
    ));
  }
  void getUpcomingMovies() async{
    final response = await _repository.getUpcomingMovies();
    emit(state.copyWith(
      movies: response.movies,
    ));
  }

}
//
// class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
//   MoviesBloc() : super(MoviesState.defaultState());
//
//   ApiRepository _repository = ApiRepository();
//
//   @override
//   Stream<MoviesState> mapEventToState(
//       MoviesEvent event,
//       ) async* {
//     if (event is GetMovies) yield* getMoviesList(event);
//     if (event is GetTrendingMovies) yield* getTrendingMovies();
//     if (event is GetUpcomingMovies) yield* getUpcomingMovies();
//   }
//
//   Stream<MoviesState> getMoviesList(GetMovies event) async* {
//     try {
//       final response = await _repository.getMovies(event.id);
//       yield state.copyWith(movies: response.movies);
//     } catch (error) {
//       print(error);
//     }
//   }
//
//   Stream<MoviesState> getTrendingMovies() async* {
//     try {
//       final response = await _repository.getTrendingMovies();
//       print(response);
//       yield state.copyWith(movies: response.movies);
//     } catch (error) {
//       print(error);
//     }
//   }
//
//   Stream<MoviesState> getUpcomingMovies() async* {
//     try {
//       final response = await _repository.getUpcomingMovies();
//       print(response);
//       yield state.copyWith(movies: response.movies);
//     } catch (error) {
//       print(error);
//     }
//   }
// }