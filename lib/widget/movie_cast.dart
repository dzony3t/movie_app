import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/cast_bloc/cast_bloc.dart';

class MovieCast extends StatefulWidget {
  final int castId;

  const MovieCast({Key key, this.castId});

  @override
  _MovieCastState createState() => _MovieCastState();
}

class _MovieCastState extends State<MovieCast> {
  CastBloc castBloc = CastBloc();

  @override
  void initState() {
    super.initState();
    castBloc = CastBloc();
    castBloc.add(GetCastEvent(id: widget.castId));
  }

  @override
  void dispose() {
    castBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: castBloc,
      builder: (context, state) {
        return Container(
          height: 170.0,
          padding: EdgeInsets.only(left: 10.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.movieCast.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(top: 10.0, right: 8.0),
                width: 100.0,
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      state.movieCast[index].profilePath == null
                          ? Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: Icon(
                                Icons.movie,
                                color: Colors.white,
                              ),
                            )
                          : Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w300/" +
                                            state
                                                .movieCast[index].profilePath)),
                              )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        state.movieCast[index].name,
                        maxLines: 2,
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        state.movieCast[index].character,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}