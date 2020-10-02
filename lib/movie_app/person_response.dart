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
  Results person;

  PersonPopular({this.person});

  PersonPopular.fromJson(Map<String, dynamic> json) {
    person = Results.fromJson(json);
  }
}
