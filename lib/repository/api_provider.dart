import 'package:dio/dio.dart';
import 'package:movie_app_flutter/main.dart';
import 'package:movie_app_flutter/model/details.dart';
import 'package:movie_app_flutter/model/genres.dart';
import 'package:movie_app_flutter/movie_app/details_response.dart';
import 'package:movie_app_flutter/movie_app/movie_response.dart';
import 'package:movie_app_flutter/movie_app/person_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  final String apiKey = 'd898c08dbff906df9958e6abe49b6588';
  static String mainUrl = 'https://api.themoviedb.org/3';
  final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: false,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonUrl = '$mainUrl/trending/person/week';
  var getTrendingUrl = '$mainUrl/trending/all/day';
  var getUpcomingMoviesUrl = '$mainUrl/movie/upcoming';
  var getFilmsById = '$mainUrl/movie';

  Future<MovieResponse> getMovies({int genreId}) async {
    print('GetMoviesMethod');
    var params = {
      "api_key": apiKey,
      "language": "pl",
      "page": 1,
      if (genreId != null) 'with_genres': genreId,
    };
    try {

      final response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return MovieResponse.withError('error');
    }
  }

  Future<MovieDetails> getMoviesDetailsById(int id) async {
    var params = {"api_key": apiKey, "language": "pl"};
    print('id: $id');
    try {
      final response = await _dio.get(getFilmsById + '/$id', queryParameters: params);
      return MovieDetails.fromJson(response.data);
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
    }
  }

  Future<MovieResponse> getTrendingMovies() async {
    var params = {"api_key": apiKey, "language": "pl", "page": 1};
    try {
      Response response = Response();
      response = await _dio.get(getTrendingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return MovieResponse.withError('error');
    }
  }

  Future<MovieResponse> getUpcomingMovies() async {
    var params = {"api_key": apiKey, "language": "pl", "page": 1};
    try {
      Response response = Response();
      response = await _dio.get(getUpcomingMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return MovieResponse.withError('error');
    }
  }

  Future<MovieResponse> getActualMovies() async {
    var params = {"api_key": apiKey, "language": "pl", "page": 1};
    try {
      Response response = Response();
      response = await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return MovieResponse.withError('error');
    }
  }

  Future<Genre> getGenres() async {
    var params = {"api_key": apiKey, "language": "pl", "page": 1};
    try {
      Response response = Response();
      response = await _dio.get(getGenresUrl, queryParameters: params);
      return Genre.fromJson(response.data);
    } catch (error, stacktrace) {
      return null;
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {
      "api_key": apiKey,
    };
    try {
      Response response = Response();
      response = await _dio.get(getPersonUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return PersonResponse.withError('error');
    }
  }
}
