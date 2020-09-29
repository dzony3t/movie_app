import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/movie_bloc/movies_bloc.dart';
import 'package:movie_app_flutter/movie_details/movie_details_texts.dart';
import 'package:movie_app_flutter/movie_details/similar_movies.dart';
import 'package:movie_app_flutter/movie_details/trailer.dart';
import 'package:movie_app_flutter/trailer_bloc/trailer_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../widget/movie_cast.dart';

class MovieDetails extends StatefulWidget {
  final MoviesBloc moviesBloc;
  final int index;

  const MovieDetails({this.moviesBloc, this.index});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: widget.moviesBloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Movie Details'),
            backgroundColor: Colors.black,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/original/' +
                                        widget.moviesBloc.state
                                            .movies[widget.index].backdropPath,
                                  )),
                            )),
                      ),
                      MovieVideo(
                        trailerId:
                            widget.moviesBloc.state.movies[widget.index].id,
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: [
                          if (widget.moviesBloc.state.movies[widget.index]
                                  .title ==
                              null)
                            Text('chwilowy brak polskiego tytułu w bazie',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ))
                          else
                            Text(
                                widget.moviesBloc.state.movies[widget.index]
                                    .title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                )),
                        ],
                      ),
                    ),
                  ),
                  MovieDetailsTexts(
                    detailsId: widget.moviesBloc.state.movies[widget.index].id,
                    index: widget.index,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.orangeAccent,
                        size: 30,
                      ),
                      const Text(
                        'Film cast: ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  MovieCast(
                    castId: widget.moviesBloc.state.movies[widget.index].id,
                  ),
                  SimilarMovies(
                    similarId: widget.moviesBloc.state.movies[widget.index].id,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MovieVideo extends StatefulWidget {
  final trailerId;
  final int index;
  MovieVideo({this.trailerId, this.index});
  @override
  _MovieVideoState createState() => _MovieVideoState();
}

class _MovieVideoState extends State<MovieVideo> {
  TrailerBloc trailerBloc = TrailerBloc();

  @override
  void initState() {
    super.initState();
    trailerBloc = TrailerBloc();
    trailerBloc.add(GetTrailers(id: widget.trailerId));
  }

  @override
  void dispose() {
    trailerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: trailerBloc,
      builder: (context, state) {
        return Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieTrailer(
                    controller: YoutubePlayerController(
                      initialVideoId: trailerBloc.state.trailer[0].key,
                      flags: YoutubePlayerFlags(
                        autoPlay: true,
                        mute: true,
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Icon(
              Icons.play_circle_outline,
              size: 60,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
