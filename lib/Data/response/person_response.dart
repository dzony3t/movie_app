

import 'package:movie_app_flutter/model/person.dart';

class PersonResponse {
  Results person;

  PersonResponse({this.person});

  PersonResponse.fromJson(Map<String, dynamic> json) {
    person = Results.fromJson(json);
  }
}
