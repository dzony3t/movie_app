import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/theme/app_colors.dart';
import 'package:movie_app_flutter/ui/routes/movies_bloc/movies_bloc.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/movie_details/movie_details.dart';
import 'package:movie_app_flutter/ui/widgets/loading_view/loading_view.dart';
import 'package:movie_app_flutter/ui/widgets/succes_page_view/succes_page_view.dart';

class TopRatedMovies extends StatefulWidget {
  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TopRatedMovies> {
  // MoviesBloc moviesBloc = MoviesBloc();
final cubit = MoviesCubit();
  @override
  void initState() {
    super.initState();
    // moviesBloc = MoviesBloc();
    // moviesBloc.add(GetTrendingMovies());
    // getIt.get<MoviesCubit>().getTrendingMovies();
    cubit.getTrendingMovies();
  }


  @override
  void dispose() {
    // moviesBloc.close();
    // getIt.get<MoviesCubit>().close();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: cubit,
      builder: (context, state) {
        if (state.movies != []) {
          return buildTopRatedWidget(state);
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

  Column buildTopRatedWidget(state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1.0,
          width: double.infinity,
          color: Colors.grey,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Icon(
                Icons.arrow_right,
                color: AppColors.iconColor,
                size: 30,
              ),
              Text(
                'Top Rated',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                                  movie: state.movies[index],
                                )),
                      );
                    },
                    child: SuccesPageView(
                      movies: state.movies[index],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
