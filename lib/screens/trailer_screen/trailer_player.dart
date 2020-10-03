import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailer extends StatelessWidget {
  final YoutubePlayerController controller;

  const MovieTrailer({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
            ),
          ),
          Positioned(
            top: 40.0,
            right: 20.0,
            child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
