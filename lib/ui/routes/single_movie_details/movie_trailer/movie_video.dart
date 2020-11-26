
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/screens/trailer_screen/trailer_cubit/trailer_cubit.dart';
import 'package:movie_app_flutter/screens/trailer_screen/trailer_player.dart';
import 'package:movie_app_flutter/theme/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieVideo extends StatefulWidget {
  final trailerId;
  MovieVideo({this.trailerId});
  @override
  _MovieVideoState createState() => _MovieVideoState();
}

class _MovieVideoState extends State<MovieVideo> {
  final cubit  = TrailerCubit();

  @override
  void initState() {
    super.initState();
    cubit.getMoviesTrailer(id: widget.trailerId);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: cubit,
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
                      initialVideoId: cubit.state.trailer[0].key,
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
              color: AppColors.secondColor,
            ),
          ),
        );
      },
    );
  }
}
