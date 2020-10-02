import 'package:flutter/material.dart';
import 'package:movie_app_flutter/model/movie_api.dart';

import 'movie_video.dart';

class MoviesNowPlaying extends StatelessWidget {
  MoviesNowPlaying({this.movies});

  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.take(20).length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Hero(
                    tag: movies[index].id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        height: 300,
                        width:200,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/original/' +
                              movies[index].posterPath,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              MovieVideo(
                trailerId: movies[index].id,
              ),
            ],
          );
        },
      ),
    );
  }
}
