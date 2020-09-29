import 'package:dio/dio.dart';
import 'package:movie_app_flutter/model/genres.dart';
import 'package:movie_app_flutter/model/person.dart';
import 'package:movie_app_flutter/model/trailer.dart';
import 'package:movie_app_flutter/movie_app/details_response.dart';
import 'package:movie_app_flutter/movie_app/film_cast_response.dart';
import 'package:movie_app_flutter/movie_app/movie_response.dart';
import 'package:movie_app_flutter/movie_app/person_response.dart';
import 'package:movie_app_flutter/movie_app/similliar_response.dart';
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
  var getPersonUrl = '$mainUrl/person/popular';
  var getTrendingUrl = '$mainUrl/movie/top_rated';
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
      final response = await _dio.get(
          getMoviesUrl,
          queryParameters: params);
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
      final response =
          await _dio.get(getFilmsById + '/$id', queryParameters: params);
      return MovieDetails.fromJson(response.data);
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return null;
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
    } catch (error) {
      return null;
    }
  }

  Future<PersonPopular> getPersons() async {
    var params = {
      "api_key": apiKey,
      'language': 'pl',
      "page": 1,
    };
    try {
      Response response = Response();
      response = await _dio.get(getPersonUrl, queryParameters: params);
      return PersonPopular.fromJson(response.data);
    } catch (error) {
//      return PersonResponse.withError('error');
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {"api_key": apiKey, "language": "pl"};
    try {
      final response = await _dio.get(getFilmsById + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<Similar> getSimilar(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      final response = await _dio.get(getFilmsById + "/$id" + "/similar",
          queryParameters: params);
      return Similar.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<Video> getTrailer(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      final response = await _dio.get(getFilmsById + "/$id" + "/videos",
          queryParameters: params);
      print(response.data);
      return Video.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
