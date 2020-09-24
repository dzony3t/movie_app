import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/movie_bloc/movies_bloc.dart';
import 'package:movie_app_flutter/movie_details_bloc/details_bloc.dart';
import 'package:movie_app_flutter/widget/movie_details_texts.dart';

import 'movie_cast.dart';

class MovieDetails extends StatelessWidget {
  final MoviesBloc moviesBloc;
  final int index;
  final DetailsBloc detailsBloc;

  const MovieDetails({Key key, this.moviesBloc, this.index, this.detailsBloc})
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
                        height: 270,
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(state.movies[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                        if (state.movies[index].title.length < 20)
                          SizedBox(
                            width: 150,
                          )
                        else
                          SizedBox(
                            width: 5,
                          ),
                      ],
                    ),
                  ),
                  MovieDetailsTexts(detailsId: state.movies[index].id, index: index,),
                  MovieCast(
                    castId: state.movies[index].id,
                  )
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
