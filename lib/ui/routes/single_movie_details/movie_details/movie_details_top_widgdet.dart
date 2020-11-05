import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/app/configure_getIt.dart';
import 'package:movie_app_flutter/model/movie.dart';
import 'package:movie_app_flutter/screens/favourite_screen/favourite_bloc.dart';
import 'package:movie_app_flutter/theme/app_colors.dart';
import 'package:movie_app_flutter/theme/app_text_styles.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/movie_trailer/movie_video.dart';
import 'package:movie_app_flutter/ui/widgets/CircularClipper.dart';
import 'package:movie_app_flutter/screens/favourite_screen/favourite_event.dart';
class DetailsTopWidget extends StatefulWidget {
  DetailsTopWidget({
    @required this.movie,
  });

  final Movie movie;

  @override
  _DetailsTopWidgetState createState() => _DetailsTopWidgetState();
}

FavouriteBloc favBloc = FavouriteBloc();

createAlertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Dodano film do ulubionych',
            style: AppTextStyles.inMainScreenTitles(),
          ),
          backgroundColor: AppColors.greyColor,
          actions: [
            MaterialButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      });
}

class _DetailsTopWidgetState extends State<DetailsTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.movie.backdropPath == null)
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
                tag: widget.movie.id,
                child: ClipShadowPath(
                    clipper: CircularDetailsImageClipper(),
                    shadow: Shadow(blurRadius: 20),
                    child: Image(
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/original/' +
                            widget.movie.backdropPath,
                      ),
                    )),
              ),
            ),
          ),
        MovieVideo(
          trailerId: widget.movie.id,
        ),
        BlocBuilder(
          cubit: favBloc,
          builder: (context, state) {
            return Positioned(
              bottom: -10.0,
              left: 5.0,
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                    getIt
                        .get<FavouriteBloc>()
                        .add(AddFavouriteMovie(movie: widget.movie));
                    final snackBar = SnackBar(
                      content: Text('Pomyslnie dodano film do ulubionych'),
                      duration: Duration(seconds: 10),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            );
          },
        ),
        Positioned(
          bottom: -10.0,
          right: 5.0,
          child: IconButton(
            icon: Icon(Icons.share),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
