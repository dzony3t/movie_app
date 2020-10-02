import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_flutter/movie_bloc/movies_bloc.dart';

import '../movie_details/movie_details.dart';

class TopRatedMovies extends StatefulWidget {
  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TopRatedMovies> {
  MoviesBloc moviesBloc = MoviesBloc();

  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc();
    moviesBloc.add(GetTrendingMovies());
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
                    color: Colors.orangeAccent,
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
                                builder: (context) => MovieDetails(
                                    movie: state.movies[index],
//                                      trailerId:
//                                          moviesBloc.state.movies[index].id,
                                    )),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            if (state.movies[index].posterPath == null)
                              Container(
                                width: 120.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.0)),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.movie,
                                      color: Colors.white,
                                      size: 60.0,
                                    )
                                  ],
                                ),
                              )
                            else
                              Container(
                                  width: 120.0,
                                  height: 180.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.0)),
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w200/" +
                                                state
                                                    .movies[index].posterPath)),
                                  )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: 100,
                              child: Text(
                                state.movies[index].title == null
                                    ? 'brak polskiego tytułu'
                                    : state.movies[index].title,
                                maxLines: 2,
                                style: TextStyle(
                                    height: 1.4,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  state.movies[index].rating.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                RatingBar(
                                  itemSize: 15.0,
                                  initialRating: state.movies[index].rating / 2,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}