import 'package:movie_app_flutter/model/details.dart';

class MovieDetailsResponse {
  Details movie;
  String error;

  MovieDetailsResponse({this.movie, this.error});

  MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    movie= Details.fromJson(json);
    error = '';
  }
}
