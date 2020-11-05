


import 'package:equatable/equatable.dart';

import 'package:movie_app_flutter/model/movie.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();
}

class AddFavouriteMovie extends FavouriteEvent {

  final Movie movie;

  AddFavouriteMovie({this.movie});
  @override
  List<Object> get props => [movie];
}

class DeleteFavouriteMovie extends FavouriteEvent{
  final int index;

  DeleteFavouriteMovie({this.index});

  @override
  List<Object> get props => [index];

}
