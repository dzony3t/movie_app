import 'package:movie_app_flutter/model/movie.dart';
class SearchResponse{
  int page;
  int totalResults;
  int totalPages;
  List<Movie> search;

  SearchResponse({this.page, this.totalResults, this.totalPages, this.search});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      search = new List<Movie>();
      json['results'].forEach((v) {
        search.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.search != null) {
      data['results'] = this.search.map((v) => v.toJson()).toList();
    }
    return data;
  }
}