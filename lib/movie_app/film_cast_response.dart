import 'package:movie_app_flutter/model/film_cast.dart';
class CastResponse {
  List<Cast> movieCast;
  String error;

  CastResponse({this.movieCast, this.error});

  CastResponse.fromJson(Map<String, dynamic> json) {
    movieCast = (json['cast'] as List).map((e) => Cast.fromJson(e)).toList();
    error = '';
  }
  CastResponse.withError(String errorValue) {
    movieCast = List();
    error = errorValue;
  }
}
