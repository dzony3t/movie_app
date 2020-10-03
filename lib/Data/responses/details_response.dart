

import 'package:movie_app_flutter/model/details.dart';

class MovieDetails {
  Details movie;
  String error;

  MovieDetails({this.movie, this.error});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    movie= Details.fromJson(json);
    error = '';
  }
  // ignore: missing_return
  MovieDetails withError(String errorValue) {
    error = errorValue;
    print(error);
  }
}
