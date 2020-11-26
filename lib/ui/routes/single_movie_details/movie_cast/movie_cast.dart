import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/ui/widgets/loading_view/loading_view.dart';

import 'cast_cubit/cast_cubit.dart';
import 'movie_cast_page.dart';

class MovieCast extends StatefulWidget {
  final int castId;

  const MovieCast({Key key, this.castId});

  @override
  _MovieCastState createState() => _MovieCastState();
}

class _MovieCastState extends State<MovieCast> {

  CastCubit castCubit = CastCubit();

  @override
  void initState() {
    super.initState();
    castCubit.getMoviesCast(id: widget.castId);
  }

  @override
  void dispose() {
    castCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: castCubit,
      builder: (context, state) {
        if (state.movieCast != null) {
          return MovieCastPage(
            movieCast: state.movieCast,
          );
        } else if (state.movies == null)
          return LoadingView();
        else
          return _buildErrorWidget();
      },
    );
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
