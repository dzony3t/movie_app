import 'package:movie_app_flutter/model/details.dart';
import 'package:movie_app_flutter/model/genres.dart';
import 'package:movie_app_flutter/model/movie_api.dart';
import 'package:movie_app_flutter/movie_app/details_response.dart';
import 'package:movie_app_flutter/movie_app/movie_response.dart';
import 'package:movie_app_flutter/movie_app/person_response.dart';
import 'package:movie_app_flutter/repository/api_provider.dart';

class ApiRepository {
  ApiProvider _provider = ApiProvider();

  Future<MovieResponse> getMovies(int id) {
    return _provider.getMovies(genreId: id);
  }

  Future<MovieDetails> getMoviesDetailsById(int id){
    return _provider.getMoviesDetailsById(id);
  }
  Future<Genre> getGenres() {
    return _provider.getGenres();
  }
  Future<MovieResponse>getActualMovies(){
    return _provider.getActualMovies();
  }

  Future<MovieResponse> getTrendingMovies(){
    return _provider.getTrendingMovies();
  }

  Future<PersonResponse> getPersonData(){
    return _provider.getPersons();
  }

  Future<MovieResponse> getUpcomingMovies(){
    return _provider.getUpcomingMovies();
  }
}
