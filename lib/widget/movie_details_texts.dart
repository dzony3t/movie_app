import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/movie_details_bloc/details_bloc.dart';

class MovieDetailsTexts extends StatefulWidget {
  final int detailsId;

  const MovieDetailsTexts({Key key, this.detailsId});
  @override
  _MovieDetailsTextsState createState() => _MovieDetailsTextsState();
}

class _MovieDetailsTextsState extends State<MovieDetailsTexts> {
  DetailsBloc detailsBloc = DetailsBloc();

  @override
  void initState() {
    super.initState();
    detailsBloc = DetailsBloc();
    detailsBloc.add(GetDetails(id: widget.detailsId));
  }

  @override
  void dispose() {
    detailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('detailsId:${widget.detailsId}');
    return BlocBuilder(
      cubit: detailsBloc,
      builder: (context, state) {
        if (state.movie == null)
          return Container(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '...',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          );
        else
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: Text('(${state.movie.releaseDate.substring(0, 4)})',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontStyle: FontStyle.italic)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: Text('${state.movie.runtime.toString()} min',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontStyle: FontStyle.italic)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: Text(state.movie.adult == false ? 'PG13' : 'R',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontStyle: FontStyle.italic)),
                  ),
                ],
              ),
              Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/original/' +
                                    state.movie.posterPath,
                              )),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      state.movie.overview.length > 0
                          ? Container(
                              width: 230,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: state.movie.overview.length > 280
                                    ? Text(
                                        state.movie.overview.substring(0, 281) +
                                            "...",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(
                                        state.movie.overview,
                                        style: TextStyle(color: Colors.white),
                                      ),
                              ),
                            )
                          : Container(
                              width: 200,
                              child: const Text(
                                'What does the old old maxim says? If there is no description, movie must be sh*tty or API is broken',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                      Container(
                          width: 200,
                          height: 40.0,
                          padding: EdgeInsets.only(right: 10.0, top: 10.0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.movie.genres.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        border: Border.all(
                                            width: 1.0, color: Colors.white)),
                                    child: Text(
                                      state.movie.genres[index].name,
                                      maxLines: 2,
                                      style: TextStyle(
                                          height: 1.4,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                );
                              }))
                    ],
                  ),
                ],
              ),
            ],
          );
      },
    );
  }
}
