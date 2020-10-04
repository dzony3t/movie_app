import 'package:movie_app_flutter/model/trailer.dart';

class VideoResponse {
  int id;
  List<Trailer> trailers;

  VideoResponse({this.id, this.trailers});

  VideoResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      trailers = new List<Trailer>();
      json['results'].forEach((v) {
        trailers.add(new Trailer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.trailers != null) {
      data['results'] = this.trailers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}