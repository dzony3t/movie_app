import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/model/movie.dart';
import 'package:movie_app_flutter/screens/favourite_screen/favourite_event.dart';
import 'package:movie_app_flutter/screens/favourite_screen/favourite_state.dart';
@singleton
class FavouriteBloc extends HydratedBloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteState.initial());
  @override
  Stream<FavouriteState> mapEventToState(
    FavouriteEvent event,
  ) async* {
    if (event is AddFavouriteMovie) yield* _getFavouriteMovie(event);
    if (event is DeleteFavouriteMovie) yield* _deleteFavouriteMovie(event);
  }

  Stream<FavouriteState> _getFavouriteMovie(AddFavouriteMovie event) async* {
    final List<Movie> list = List.from(state.movies);
    list.add(event.movie);
    yield (state.copyWith(movies: list));
  }

  Stream<FavouriteState> _deleteFavouriteMovie(DeleteFavouriteMovie event) async* {
     List<Movie> list = List.from(state.movies);
    list.removeAt(event.index);
    yield (state.copyWith(movies: list));
  }

  @override
  FavouriteState fromJson(Map<String, dynamic > json)=> json != null ? FavouriteState.fromJson(json) : FavouriteState.initial();

  @override
  Map<String,dynamic> toJson(FavouriteState state)=> state.toJson();
}
