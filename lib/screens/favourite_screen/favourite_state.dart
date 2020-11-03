import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:movie_app_flutter/model/movie.dart';

part 'favourite_state.freezed.dart';
part 'favourite_state.g.dart';

// class FavouriteState extends Equatable {
//   const FavouriteState({this.movies});
//
//   final List<Movie> movies;
//   factory FavouriteState.defaultState() => FavouriteState(movies: []);
//
//   @override
//   List<Object> get props => [movies];
//
//   FavouriteState copyWith({List<Movie> movies}) {
//     return FavouriteState(movies: movies ?? this.movies);
//   }
// }
//
@freezed
abstract class FavouriteState with _$FavouriteState {
  const factory FavouriteState({List<Movie> movies}) = _FavouriteState;
  const FavouriteState._();
  factory FavouriteState.fromJson(Map<String, dynamic> json) =>
      _$FavouriteStateFromJson(json);
  factory FavouriteState.initial() => FavouriteState(movies: []);
}
