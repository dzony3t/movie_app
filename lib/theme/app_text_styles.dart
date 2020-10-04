import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyles{
  static TextStyle firstDetailsOfMovie() => TextStyle(
      color: Colors.grey,
      fontSize: 15,
      fontStyle: FontStyle.italic
  );
  static TextStyle detailsOverview() => TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
  static TextStyle genresDetails() => TextStyle(
      height: 1.4,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 12.0
  );
  static TextStyle detailsTitle() => TextStyle(
    color: Colors.white,
    fontSize: 30,
  );
  static TextStyle similarMoviesTitlenCast() => TextStyle(
      height: 1.4,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 13.0
  );
}