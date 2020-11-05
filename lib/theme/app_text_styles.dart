import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle firstDetailsOfMovie() =>
      TextStyle(color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic);
  static TextStyle detailsOverview() => TextStyle(
        color: Colors.white,
        fontSize: 16,
      );
  static TextStyle genresDetails() => TextStyle(
      height: 1.4,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 12.0);
  static TextStyle detailsTitle() => TextStyle(
        color: Colors.white,
        fontSize: 30,
      );
  static TextStyle similarMoviesTitlenCast() => TextStyle(
      height: 1.4,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 13.0);
  static TextStyle genresTitle() => TextStyle(
      height: 1.4,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 15.0);

  static TextStyle favTitleDetail() => TextStyle(
        height: 1.4,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      );

  static TextStyle rating() => TextStyle(
      color: Colors.white,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);

  static TextStyle inMainScreenTitles() => TextStyle(
        color: Colors.white,
        fontSize: 20,
      );
}
