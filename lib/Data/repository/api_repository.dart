import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/Data/response/details_response.dart';
import 'package:movie_app_flutter/Data/response/person_response.dart';
import 'package:movie_app_flutter/Data/response/similliar_response.dart';
import 'package:movie_app_flutter/Data/response/video_response.dart';
import 'package:movie_app_flutter/data/response/film_cast_response.dart';
import 'package:movie_app_flutter/data/response/movie_response.dart';
import 'package:movie_app_flutter/data/response/search_response.dart';
import 'package:movie_app_flutter/Data/repository/apiClient.dart';
import 'package:movie_app_flutter/model/genres.dart';
@singleton
class ApiRepository {
  ApiClient _provider = ApiClient();

  Future<MovieResponse> getMovies(int id) => _provider.getMovies(genreId: id);

  Future<MovieDetailsResponse> getMoviesDetailsById(int id) =>
      _provider.getMoviesDetailsById(id);

  Future<Genre> getGenres() => _provider.getGenres();

  Future<MovieResponse> getActualMovies() => _provider.getActualMovies();

  Future<MovieResponse> getTrendingMovies() => _provider.getTrendingMovies();

  Future<PersonResponse> getPersonData(id) => _provider.getPersons(id);

  Future<MovieResponse> getUpcomingMovies() => _provider.getUpcomingMovies();

  Future<CastResponse> getCasts(id) => _provider.getCasts(id);

  Future<SimilarResponse> getSimilar(id) => _provider.getSimilar(id);

  Future<VideoResponse> getTrailer(id) => _provider.getTrailer(id);

  Future<SearchResponse> searchMovies(String query) =>
      _provider.searchMovies(query: query);
}
