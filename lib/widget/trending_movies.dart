import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_flutter/movie_bloc/movies_bloc.dart';

class TrendingMovies extends StatefulWidget {
  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  MoviesBloc moviesBloc = MoviesBloc();

  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc();
    moviesBloc.add(GetTrendingMovies());
  }

  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: moviesBloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_right, color: Colors.orangeAccent,size: 30,),
                  Text(
                    'Trending movies',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height:300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          state.movies[index].posterPath == null
                              ? Container(
                                width: 120.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(2.0)),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.movie,
                                      color: Colors.white,
                                      size: 60.0,
                                    )
                                  ],
                                ),
                              )
                              : Container(
                                  width: 120.0,
                                  height: 180.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(2.0)),
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w200/" +
                                                state.movies[index]
                                                    .posterPath)),
                                  )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 100,
                            child: Text(
                              state.movies[index].title == null
                                  ? 'brak pl tytułu'
                                  : state.movies[index].title,
                              maxLines: 2,
                              style: TextStyle(
                                  height: 1.4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                state.movies[index].rating
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              RatingBar(
                                itemSize: 18.0,
                                initialRating: state.movies[index].rating/2,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}


//
//Scaffold(
//backgroundColor: Colors.black,
//appBar: AppBar(
//title: Text('Movie Details'),
//),
//body: SafeArea(
//child: SingleChildScrollView(
//child: Column(
//children: [
//Padding(
//padding: const EdgeInsets.symmetric(vertical: 15),
//child: Container(
//alignment: Alignment.bottomCenter,
//height: 300,
//decoration: BoxDecoration(
//shape: BoxShape.rectangle,
//image: DecorationImage(
//fit: BoxFit.fill,
//image: NetworkImage(
//'https://image.tmdb.org/t/p/original/' +
//detailsBloc.state.details.backdropPath,
//)),
//)),
//),
//Container(
//padding: EdgeInsets.symmetric(horizontal: 10),
//child: Row(
//children: [
//Text(state.details.title,
//style: TextStyle(
//color: Colors.white,
//fontSize: 30,
//)),
//Expanded(
//child: Container(),
//),
//RatingBar(
//itemSize: 40.0,
//initialRating: state.details.rating / 2,
//direction: Axis.horizontal,
//itemCount: 1,
//itemBuilder: (context, _) => Icon(
//Icons.star,
//color: Colors.yellow,
//),
//),
//Column(
//children: [
//RichText(
//text: TextSpan(
//text: state.details.rating.toString(),
//style: TextStyle(
//color: Colors.white, fontSize: 25),
//children: <TextSpan>[
//TextSpan(
//text: '/10',
//style: TextStyle(
//color: Colors.white, fontSize: 19))
//]),
//),
//Text(
//state.details.voteCount.toString(),
//style: TextStyle(color: Colors.white),
//),
//],
//),
//],
//),
//),
//Row(
//children: [
//Padding(
//padding: const EdgeInsets.symmetric(
//horizontal: 15.0, vertical: 5),
//child: Text(
//'(${state.details.releaseDate.substring(0, 4)})',
//style: TextStyle(
//color: Colors.grey,
//fontSize: 15,
//fontStyle: FontStyle.italic)),
//),
//],
//),
//Padding(
//padding: EdgeInsets.symmetric(horizontal: 5),
//child: Container(
//height: 1.0,
//width: double.infinity,
//color: Colors.grey,
//),
//),
//Row(
//children: [
//Padding(
//padding: const EdgeInsets.symmetric(vertical: 15),
//child: Container(
//alignment: Alignment.bottomCenter,
//height: 170,
//width: 150,
//decoration: BoxDecoration(
//shape: BoxShape.rectangle,
//image: DecorationImage(
//fit: BoxFit.fitHeight,
//image: NetworkImage(
//'https://image.tmdb.org/t/p/original/' +
//state.movies.posterPath,
//)),
//)),
//),
//Column(
//children: [
//state.movies.overview.length > 0
//? Container(
//width: 200,
//child: Padding(
//padding: const EdgeInsets.all(10.0),
//child: state.movies
//    .overview.length >
//280
//? Text(
//state.movies
//    .overview
//    .substring(0, 281) +
//"...",
//style:
//TextStyle(color: Colors.white),
//)
//: Text(
//state.details.overview,
//style:
//TextStyle(color: Colors.white),
//),
//),
//)
//: Container(
//width: 200,
//child: const Text(
//'What does the old old maxim says? If there is no description, movie must be sh*tty or API is broken',
//style: TextStyle(
//color: Colors.white,
//),
//)),
//],
//),
//],
//),
//Row(
//children: [
//const Icon(
//Icons.arrow_right,
//color: Colors.orangeAccent,
//size: 30,
//),
//const Text(
//'Film cast: ',
//style: TextStyle(fontSize: 20, color: Colors.white),
//),
//],
//),
//],
//),
//),
//),
//);