import 'package:movie_app_flutter/model/genres.dart';
import 'package:movie_app_flutter/model/person.dart';
import 'package:movie_app_flutter/model/trailer.dart';
import 'package:movie_app_flutter/movie_app/details_response.dart';
import 'package:movie_app_flutter/movie_app/film_cast_response.dart';
import 'package:movie_app_flutter/movie_app/movie_response.dart';
import 'package:movie_app_flutter/movie_app/person_response.dart';
import 'package:movie_app_flutter/movie_app/similliar_response.dart';
import 'package:movie_app_flutter/repository/api_provider.dart';

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

  Future<PersonPopular> getPersonData() {
    return _provider.getPersons();
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
}
