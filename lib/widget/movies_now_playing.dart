import 'package:flutter/material.dart';
import 'package:movie_app_flutter/model/movie_api.dart';
import 'package:page_indicator/page_indicator.dart';

class MoviesNowPlaying extends StatelessWidget {
  MoviesNowPlaying({this.movies});

  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 355,
      width: MediaQuery.of(context).size.width,
      child: PageIndicatorContainer(
        length: movies.take(4).length,
        align: IndicatorAlign.bottom,
        indicatorColor: Colors.grey,
        indicatorSpace: 15,
        padding: EdgeInsets.all(8),
        indicatorSelectorColor: Colors.orangeAccent,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.take(4).length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  height: 400,
                    decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/original/' +
                              movies[index].posterPath,
                          scale: 0.7)),
                )),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [
                        0.0,
                        0.9,
                      ],
                    )
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Icon(Icons.play_circle_filled, color: Colors.red[100], size: 80,),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
