import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/ui/routes/movies_bloc/movies_bloc.dart';
import 'package:movie_app_flutter/ui/view/loading_view/loading_view.dart';

import 'movies_by_genre_page.dart';

class MoviesByGenre extends StatefulWidget {
  final int genreId;

  MoviesByGenre({this.genreId});

  @override
  _MovieGenreState createState() => _MovieGenreState();
}

class _MovieGenreState extends State<MoviesByGenre> {
  MoviesBloc moviesBloc = MoviesBloc();

  @override
  void initState() {
    moviesBloc.add(GetMovies(id: widget.genreId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: moviesBloc,
        builder: (context, state) {
          if (state.movies != []) {
            return MoviesByGenrePage(movies: state.movies,);
          } else if (state.movies == [])
            return LoadingView();
          else
            return _buildErrorWidget();
        });
  }

  Widget _buildErrorWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error"),
      ],
    ));
  }
  
}
