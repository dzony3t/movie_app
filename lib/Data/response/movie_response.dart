import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_flutter/model/movie.dart';
// part'movie_response.freezed.dart';
// part 'movie_response.g.dart';

// @freezed
// abstract class MovieResponse with _$MovieResponse{
// const factory MovieResponse({
//   List<Movie> movies
// }) = _MovieResponse;
//   factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);
class MovieResponse{
  List<Movie> movies;
  String error;

  MovieResponse({this.movies, this.error});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    movies = (json['results'] as List).map((e) => Movie.fromJson(e)).toList();
    error = '';
  }
  MovieResponse.withError(String errorValue) {
    movies = List();
    error = errorValue;
    print(error);
  }
}
