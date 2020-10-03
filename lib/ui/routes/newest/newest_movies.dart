import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/ui/routes/movies_bloc/movies_bloc.dart';
import 'package:movie_app_flutter/ui/view/succes_page_view/succes_page_view.dart';

import '../page_details/movie_details/movie_details.dart';
import '../../view/loading_view/loading_view.dart';

class NewestMovies extends StatefulWidget {
  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<NewestMovies> {
  MoviesBloc moviesBloc = MoviesBloc();

  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc();
    moviesBloc.add(GetUpcomingMovies());
  }

  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: moviesBloc,
      builder: (context, state) {
        if (state.movies != []) {
          return buildUpcomingHomeWidget(state);
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

  Column buildUpcomingHomeWidget(state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1.0,
          width: double.infinity,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Icon(
                Icons.arrow_right,
                color: Colors.orangeAccent,
                size: 30,
              ),
              Text(
                'Najnowsze filmy',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
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
                    child: Column(
                      children: [
                        SuccesPageView(
                          movies: state.movies[index],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Container(
                            child: Text(
                              state.movies[index].releaseDate.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
