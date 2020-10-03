import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/screens/search_screen/search_screen.dart';
import 'package:movie_app_flutter/ui/routes/movies_bloc/movies_bloc.dart';
import 'package:movie_app_flutter/ui/routes/movies_by_genre/genres_movies.dart';
import 'package:movie_app_flutter/ui/routes/now_playing/movies_now_playing.dart';
import 'package:movie_app_flutter/ui/routes/top_rated/top_rated.dart';
import 'package:movie_app_flutter/ui/routes/newest/newest_movies.dart';

class Movie extends StatefulWidget {
  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  MoviesBloc moviesBloc = MoviesBloc();
  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc();
    moviesBloc.add(GetMovies());
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
          return Scaffold(
            appBar: AppBar(
              leading: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              backgroundColor: Colors.black,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  },
                )
              ],
              title: Text(
                'MovieApp',
                style: TextStyle(color: Colors.orangeAccent, fontSize: 25),
              ),
            ),
            body: Container(
              color: Colors.black,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  MoviesNowPlaying(
                    movies: state.movies,
                  ),
                  GenresMovies(),
                  TopRatedMovies(),
                  NewestMovies(),
                  // PopularPersons(),
                ],
              ),
            ),
          );
        });
  }
}
