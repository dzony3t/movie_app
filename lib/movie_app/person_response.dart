import 'package:movie_app_flutter/model/person.dart';

class PersonResponse {
  List<Person> persons;
  String error;

  PersonResponse({this.persons, this.error});

  PersonResponse.fromJson(Map<String, dynamic> json) {
    persons = (json['results'] as List).map((e) => Person.fromJson(e)).toList();
    error = '';
  }
  PersonResponse.withError(String errorValue) {
    persons = List();
    error = errorValue;
  }
}
