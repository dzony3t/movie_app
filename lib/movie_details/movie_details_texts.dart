import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_flutter/movie_details_bloc/details_bloc.dart';

class MovieDetailsTexts extends StatefulWidget {
  final int detailsId;
  final int index;
  const MovieDetailsTexts({Key key, this.detailsId, this.index});
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
                  RatingBar(
                    onRatingUpdate: null,
                    itemSize: 20.0,
                    initialRating: state.movie.voteAverage / 2,
                    direction: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ),
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: state.movie.voteAverage.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 15, fontStyle: FontStyle.italic),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '/10',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ]),
                      ),
                      Text(
                        state.movie.voteCount.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          height: 170,
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
                        if (state.movie.overview.length > 0)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OverviewDetails(details: state.movie,)));
                            },
                            child: Container(
                              width: 200,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: state.movie.overview.length > 200
                                    ? Text(
                                        state.movie.overview.substring(0, 100) +
                                            "...",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(
                                        state.movie.overview,
                                        style: TextStyle(color: Colors.white),
                                      ),
                              ),
                            ),
                          )
                        else
                          Container(
                              width: 200,
                              child: const Text(
                                'What does the old old maxim says? If there is no description, movie must be sh*tty or API is broken',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                        Container(
                            width: 200,
                            height: 35.0,
                            padding: EdgeInsets.only(right: 10.0, top: 5.0),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.movie.genres.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
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
              ),
            ],
          );
      },
    );
  }
}

class OverviewDetails extends StatelessWidget {
  final details;
  OverviewDetails({this.details});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Description'),),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Text(details.overview, style: TextStyle(color: Colors.white, fontSize: 15),),
          ),
        ),
      ),
    );
  }
}
