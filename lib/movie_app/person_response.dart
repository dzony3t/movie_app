//import 'package:movie_app_flutter/model/person.dart';
//
//class PersonResponse {
//  List<Results> persons;
//  String error;
//
//  PersonResponse({this.persons, this.error});
//
//  PersonResponse.fromJson(Map<String, dynamic> json) {
//    persons = ((json['results'] ?? json['cast']) as List)
//        .map((e) => Results.fromJson(e))
//        .toList();
//    error = '';
//  }
//  PersonResponse.withError(String errorValue) {
//    persons = List();
//    error = errorValue;
//  }
//}
//
import 'package:movie_app_flutter/model/person.dart';

class PersonPopular {
  List<Results> person;

  PersonPopular({this.person});

  PersonPopular.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      person = List();
      json['results'].forEach((v) {
       person.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.person != null) {
      data['results'] = this.person.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

