import 'package:flutter/material.dart';
import 'package:movie_app_flutter/model/movie_api.dart';
import 'package:movie_app_flutter/movie_details/movie_details.dart';
import 'package:movie_app_flutter/movie_details/trailer.dart';
import 'package:page_indicator/page_indicator.dart';

class MoviesNowPlaying extends StatelessWidget {
  MoviesNowPlaying({this.movies});

  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: PageIndicatorContainer(
        length: movies.take(5).length,
        align: IndicatorAlign.bottom,
        indicatorColor: Colors.grey,
        indicatorSpace: 15,
        padding: EdgeInsets.all(8),
        indicatorSelectorColor: Colors.orangeAccent,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.take(5).length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/original/' +
                            movies[index].posterPath,
                      )),
                )),
                MovieVideo(trailerId: movies[index].id,),
              ],
            );
          },
        ),
      ),
    );
  }
}
