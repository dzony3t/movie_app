import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_flutter/ui/routes/movies_bloc/movies_bloc.dart';
import 'package:movie_app_flutter/ui/routes/page_details/movie_details/movie_details.dart';

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
          return Container(
            color: Colors.black,
            height: 300.0,
            padding: EdgeInsets.only(left: 10.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      print(state.movies[index].id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                                movie: state.movies[index],
                            )),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (state.movies[index].posterPath == null) Container(
                              width: 120.0,
                              height: 170.0,
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
                            ) else Container(
                                width: 120.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(2.0)),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w200/" +
                                              state.movies[index]
                                                  .posterPath)),
                                )),
                        SizedBox(
                          height: 10.0,
                        ),
                        if (state.movies[index].title.length > 20)
                          Container(
                            width: 100,
                            child: Text(
                              state.movies[index].title == null
                                  ? 'brak polskiego tytułu'
                                  : state.movies[index].title
                                  .toString()
                                  .substring(0, 15) + '...',
                              maxLines: 2,
                              style: TextStyle(
                                  height: 1.4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          )
                        else
                        Container(
                          width: 100,
                          child: Text(
                            state.movies[index].title,
                            maxLines: 2,
                            style: TextStyle(
                                height: 1.4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              state.movies[index].rating.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
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
              },
            ),
          );
        });
  }
}
