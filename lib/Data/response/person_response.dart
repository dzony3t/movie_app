

import 'package:movie_app_flutter/model/person.dart';

class PersonPopular {
  Results person;

  PersonPopular({this.person});

  PersonPopular.fromJson(Map<String, dynamic> json) {
    person = Results.fromJson(json);
  }
}
