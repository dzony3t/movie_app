
import 'package:movie_app_flutter/data/responses/details_response.dart';
import 'package:movie_app_flutter/data/responses/film_cast_response.dart';
import 'package:movie_app_flutter/data/responses/movie_response.dart';
import 'package:movie_app_flutter/data/responses/person_response.dart';
import 'package:movie_app_flutter/data/responses/search_response.dart';
import 'package:movie_app_flutter/data/responses/similliar_response.dart';
import 'package:movie_app_flutter/Data/repository/api_provider.dart';
import 'package:movie_app_flutter/model/genres.dart';
import 'package:movie_app_flutter/model/trailer.dart';

class ApiRepository {
  ApiProvider _provider = ApiProvider();

  Future<MovieResponse> getMovies(int id) {
    return _provider.getMovies(genreId: id);
  }

  Future<MovieDetails> getMoviesDetailsById(int id) {
    return _provider.getMoviesDetailsById(id);
  }

  Future<Genre> getGenres() {
    return _provider.getGenres();
  }

  Future<MovieResponse> getActualMovies() {
    return _provider.getActualMovies();
  }

  Future<MovieResponse> getTrendingMovies() {
    return _provider.getTrendingMovies();
  }

  Future<PersonPopular> getPersonData(id) {
    return _provider.getPersons(id);
  }

  Future<MovieResponse> getUpcomingMovies() {
    return _provider.getUpcomingMovies();
  }

  Future<CastResponse> getCasts(id) {
    return _provider.getCasts(id);
  }

  Future<Similar> getSimilar(id) {
    return _provider.getSimilar(id);
  }

  Future<Video> getTrailer(id) {
    return _provider.getTrailer(id);
  }

  Future<SearchResponse> searchMovies(String query) {
    return _provider.searchMovies(query: query);
  }
}
