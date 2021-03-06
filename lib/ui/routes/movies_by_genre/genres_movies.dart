
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/model/genres.dart';


import 'genres_bloc/genres_bloc.dart';
import 'movies_by_genre.dart';

class GenresMovies extends StatefulWidget {
  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresMovies>
    with SingleTickerProviderStateMixin {
  GenresBloc genresBloc = GenresBloc();
  TabController _categoryController;

  @override
  void initState() {
    super.initState();
    genresBloc = GenresBloc();
    genresBloc.add(GetGenres());
    _categoryController = TabController(vsync: this, length: 19);
  }

  @override
  void dispose() {
    genresBloc.close();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: genresBloc,
        builder: (context, state) {
          return Container(
            height: 330,
            child: DefaultTabController(
              length: state.genres.length,
              child: Builder(builder: (BuildContext context) {
                return Scaffold(
                  appBar: PreferredSize(
                      child: AppBar(
                        backgroundColor: Colors.black,
                        bottom: TabBar(
                          indicatorColor: Colors.orange,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 3.0,
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.white,
                          isScrollable: true,
                          tabs: state.genres.map<Widget>((Genres genre) {
                            return Container(
                              padding: EdgeInsets.only(bottom: 15, top: 10),
                              child: Text(
                                genre
                                    .name,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      preferredSize: Size.fromHeight(50)),
                  body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: state.genres.map<Widget>((Genres genre) {
                      return MoviesByGenre(
                        genreId:
                        genre.id,
                      );
                    }).toList(),
                  ),
                );
              }),
            ),
          );
        });
  }
}
