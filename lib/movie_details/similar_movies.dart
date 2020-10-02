import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/similiar_bloc/similiar_bloc.dart';
import 'movie_details.dart';

class SimilarMovies extends StatefulWidget {
  final int similarId;
  final moviesBloc;
  const SimilarMovies({this.similarId, this.moviesBloc});

  @override
  _SimilarMoviesState createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  SimilarBloc similarBloc = SimilarBloc();

  @override
  void initState() {
    super.initState();
    similarBloc = SimilarBloc();
    similarBloc.add(GetSimilarMovies(id: widget.similarId));
  }

  @override
  void dispose() {
    similarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: similarBloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_right,
                    color: Colors.orangeAccent,
                    size: 30,
                  ),
                  Text(
                    'Similar Movies',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.similarMovies.length,
                    itemBuilder: (context, index) {
                      print(state.similarMovies.length);
                      if (state.similarMovies == [])
                        return Container(
                          child: Text(
                            'chwilowy brak podobnych filmów w bazie, pracujemy nad tym!', style: TextStyle(color: Colors.white, fontSize: 30),),
                        );
                      else return Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetails(
                                    movie: state.similarMovies[index],
                                  ),
                                ));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (state.similarMovies[index].posterPath == null)
                                Container(
                                  width: 120.0,
                                  height: 180.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.0)),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.movie,
                                        color: Colors.white,
                                        size: 60.0,
                                      )
                                    ],
                                  ),
                                )
                              else
                                Container(
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
                                                  state.similarMovies[index]
                                                      .posterPath)),
                                    )),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: 100,
                                child: Text(
                                  state.similarMovies[index].title == null
                                      ? 'brak polskiego tytułu'
                                      : state.similarMovies[index].title,
                                  maxLines: 2,
                                  style: TextStyle(
                                      height: 1.4,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                ),
                              ),
                            ],
                          ),
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
