
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/model/movie.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/movie_trailer/movie_video.dart';
import 'package:movie_app_flutter/ui/widgets/CircularClipper.dart';

class DetailsTopWidget extends StatelessWidget {
  const DetailsTopWidget({
    @required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
