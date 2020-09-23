import 'package:movie_app_flutter/model/movie_api.dart';

class MovieResponse {
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
