import 'package:movie_app_flutter/model/movie_api.dart';

class Similar {
  int page;
  List<Movie> similar;
  int totalPages;
  int totalResults;

  Similar({this.page, this.similar, this.totalPages, this.totalResults});

  Similar.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      similar = new List<Movie>();
      json['results'].forEach((v) {
        similar.add(new Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.similar != null) {
      data['results'] = this.similar.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}
