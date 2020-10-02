import 'package:flutter/material.dart';
import 'package:movie_app_flutter/model/movie_api.dart';
import 'package:movie_app_flutter/movie_details/movie_details_texts.dart';
import 'package:movie_app_flutter/movie_details/similar_movies.dart';
import 'package:movie_app_flutter/widget/CircularClipper.dart';
import 'package:movie_app_flutter/widget/movie_video.dart';

import '../widget/movie_cast.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(icon: Icon(Icons.arrow_back, size: 20, color: Colors.yellow), onPressed: (){
                Navigator.pop(context);
              },),
              Stack(
                children: [
                  if (movie.backdropPath == null)
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        shape: BoxShape.rectangle,
                      ),
                      child: Icon(
                        Icons.movie,
                        color: Colors.white,
                        size: 60.0,
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Container(
                        transform: Matrix4.translationValues(0.0, -10, 0.0),
                        child: Hero(
                          tag: movie.id,
                          child: ClipShadowPath(
                              clipper: CircularDetailsImageClipper(),
                              shadow: Shadow(blurRadius: 20),
                              child: Image(
                                width: double.infinity,
                                height: 300,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/original/' +
                                      movie.backdropPath,
                                ),
                              )),
                        ),
                      ),
                    ),
                  MovieVideo(
                    trailerId: movie.id,
                  ),
                  Positioned(
                    bottom: -10.0,
                    left: 5.0,
                    child: IconButton(icon: Icon(Icons.add), color: Colors.white, iconSize: 30, onPressed: (){

                    },),
                  ),
                  Positioned(
                    bottom: -10.0,
                    right: 5.0,
                    child: IconButton(icon: Icon(Icons.share), color: Colors.white, iconSize: 30, onPressed: (){

                    },),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      if (movie.title == null)
                        Text('chwilowy brak polskiego tytułu w bazie',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ))
                      else
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          child: Text(movie.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              )),
                        ),
                    ],
                  ),
                ),
              ),
              MovieDetailsTexts(
                detailsId: movie.id,
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
                castId: movie.id,
              ),
              SimilarMovies(similarId: movie.id),
            ],
          ),
        ),
      ),
    );
  }
}
