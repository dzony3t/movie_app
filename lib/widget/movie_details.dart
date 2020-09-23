import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_flutter/model/details.dart';
import 'package:movie_app_flutter/model/movie_api.dart';
import 'package:movie_app_flutter/movie_bloc/movies_bloc.dart';
import 'package:movie_app_flutter/movie_details_bloc/details_bloc.dart';
import 'package:movie_app_flutter/widget/movie_details_texts.dart';

class MovieDetails extends StatelessWidget {
  final MoviesBloc moviesBloc;
  final int index;
  final DetailsBloc detailsBloc;

  const MovieDetails(
      {Key key, this.moviesBloc, this.index, this.detailsBloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: moviesBloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Movie Details'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/original/' +
                                    state.movies[index].backdropPath,
                              )),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(state.movies[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                        Expanded(
                          child: Container(),
                        ),
                        RatingBar(
                          itemSize: 40.0,
                          initialRating: state.movies[index].rating / 2,
                          direction: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ),
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: state.movies[index].rating.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/10',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 19))
                                  ]),
                            ),
                            Text(
                              state.movies[index].voteCount.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MovieDetailsTexts(detailsId: state.movies[index].id),
//                  Row(
//                    children: [
//                      const Icon(
//                        Icons.arrow_right,
//                        color: Colors.orangeAccent,
//                        size: 30,
//                      ),
//                      const Text(
//                        'Film cast: ',
//                        style: TextStyle(fontSize: 20, color: Colors.white),
//                      ),
//                    ],
//                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
