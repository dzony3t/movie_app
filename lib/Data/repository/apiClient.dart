import 'package:dio/dio.dart';
import 'package:movie_app_flutter/Data/response/details_response.dart';
import 'package:movie_app_flutter/Data/response/similliar_response.dart';
import 'package:movie_app_flutter/data/response/film_cast_response.dart';
import 'package:movie_app_flutter/data/response/movie_response.dart';
import 'package:movie_app_flutter/data/response/person_response.dart';
import 'package:movie_app_flutter/data/response/search_response.dart';
import 'package:movie_app_flutter/model/genres.dart';
import 'package:movie_app_flutter/model/trailer.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final String apiKey = 'd898c08dbff906df9958e6abe49b6588';
  final Dio _dio = Dio(BaseOptions(
      baseUrl:
      'https://api.themoviedb.org/3'))
    ..interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: false,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));


  Future<MovieResponse> getMovies({int genreId}) async {
    print('GetMoviesMethod');
    var params = {
      "api_key": apiKey,
      "language": "pl",
      "page": 1,
      if (genreId != null) 'with_genres': genreId,
    };
    final response = await _dio.get('/discover/movie', queryParameters: params);
    return MovieResponse.fromJson(response.data);
  }

  Future<MovieDetails> getMoviesDetailsById(int id) async {
    var params = {"api_key": apiKey, "language": "pl"};
    print('id: $id');
    final response =
        await _dio.get('/movie' + '/$id', queryParameters: params);
    return MovieDetails.fromJson(response.data);
  }

  Future<MovieResponse> getTrendingMovies() async {
    var params = {"api_key": apiKey, "language": "pl", "page": 1};
    final response = await _dio.get('/movie/top_rated', queryParameters: params);
    return MovieResponse.fromJson(response.data);
  }

  Future<SearchResponse> searchMovies({String query}) async {
    var params = {
      "api_key": apiKey,
      "language": "pl",
      if (query != null) 'query': query
    };
    final response =
        await _dio.get('/search/movie', queryParameters: params);
    return SearchResponse.fromJson(response.data);
  }

  Future<MovieResponse> getUpcomingMovies() async {
    var params = {"api_key": apiKey, "language": "pl", "page": 1};
    final response =
        await _dio.get('/movie/upcoming', queryParameters: params);
    return MovieResponse.fromJson(response.data);
  }

  Future<MovieResponse> getActualMovies() async {
    var params = {"api_key": apiKey, "language": "pl", "page": 1};
    final response = await _dio.get('movie/now_playing', queryParameters: params);
    return MovieResponse.fromJson(response.data);
  }

  Future<Genre> getGenres() async {
    var params = {"api_key": apiKey, "language": "pl", "page": 1};
    final response = await _dio.get('/genre/movie/list', queryParameters: params);
    return Genre.fromJson(response.data);
  }

  Future<PersonPopular> getPersons(int id) async {
    var params = {
      "api_key": apiKey,
      'language': 'en-US',
      "page": 1,
    };
    final response =
        await _dio.get('/person' + '/$id', queryParameters: params);
    return PersonPopular.fromJson(response.data);
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {"api_key": apiKey, "language": "pl"};
    final response = await _dio.get('/movie' + "/$id" + "/credits",
        queryParameters: params);
    return CastResponse.fromJson(response.data);
  }

  Future<Similar> getSimilar(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    final response = await _dio.get('/movie' + "/$id" + "/similar",
        queryParameters: params);
    return Similar.fromJson(response.data);
  }

  Future<Video> getTrailer(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    final response = await _dio.get('/movie' + "/$id" + "/videos",
        queryParameters: params);
    return Video.fromJson(response.data);
  }
}
