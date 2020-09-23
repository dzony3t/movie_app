import 'package:movie_app_flutter/model/details.dart';
import 'package:movie_app_flutter/model/movie_api.dart';
import 'package:movie_app_flutter/widget/movie_details.dart';

class MovieDetails {
  Details movie;
  String error;

  MovieDetails({this.movie, this.error});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    movie= Details.fromJson(json);
    error = '';
  }
  MovieDetails withError(String errorValue) {
    error = errorValue;
    print(error);
  }
}
