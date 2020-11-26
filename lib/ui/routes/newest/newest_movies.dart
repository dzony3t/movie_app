import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/app/configure_getIt.dart';
import 'package:movie_app_flutter/ui/routes/movies_bloc/movies_bloc.dart';
import 'package:movie_app_flutter/ui/widgets/loading_view/loading_view.dart';
import 'newest_movies_page.dart';

class NewestMovies extends StatefulWidget {
  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<NewestMovies> {
  // MoviesBloc moviesBloc = MoviesBloc();
  final cubit  = MoviesCubit();

  @override
  void initState() {
    super.initState();
    // moviesBloc.add(GetUpcomingMovies());
    // getIt.get<MoviesCubit>().getUpcomingMovies();
    cubit.getUpcomingMovies();
  }

  @override
  void dispose() {
    // moviesBloc.close();
    getIt.get<MoviesCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: cubit,
      builder: (context, state) {
        if (state.movies != []) {
          return NewestMoviesPage(
            movies: state.movies,
          );
        } else if (state.movies == [])
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
