
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/screens/search_screen/search_bloc/search_bloc.dart';
import 'package:movie_app_flutter/ui/routes/page_details/movie_details/movie_details.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchBloc searchBloc = SearchBloc();

  final _formKey = GlobalKey<FormState>();
  final _searchQuery = TextEditingController();
  Timer _debounce;

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    if (_searchQuery.text.length < 3) return;
    else
      _debounce = Timer(const Duration(milliseconds: 500), () {
        searchBloc.add(SearchMoviesEvent(query: _searchQuery.text));
      });
  }

  @override
  void initState() {
    super.initState();
    searchBloc = SearchBloc();
    _searchQuery.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchQuery.removeListener(_onSearchChanged);
    _searchQuery.dispose();
    _debounce?.cancel();
    searchBloc.close();
    super.dispose();
  }

  var validator = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: searchBloc,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: Text('search your fav'),
            backgroundColor: Colors.grey[900],
          ),
          body: Column(
            children: [
              Form(
                autovalidate: validator,
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _searchQuery,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Wpisz film',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'nie czytam w myślach, wpisz ten film =)';
                        }
                        return null;
                      },
                    ),
                    if (state.results == null)
                      Container(child: Text('...'))
                    else
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 550,
                          child: ListView.builder(
                              itemCount: state.results.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MovieDetailsScreen(
                                                  movie: state.results[index])));
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            if (state.results[index].posterPath ==
                                                null)
                                              Container(
                                                width: 100.0,
                                                height: 140.0,
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
                                            else
                                              Container(
                                                  width: 100.0,
                                                  height: 140.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(2.0)),
                                                    shape: BoxShape.rectangle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            "https://image.tmdb.org/t/p/w200/" +
                                                                state.results[index]
                                                                    .posterPath)),
                                                  )),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 180,
                                                  child: Text(
                                                    state.results[index].title ==
                                                        null
                                                        ? 'brak polskiego tytułu'
                                                        : state
                                                        .results[index].title,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        height: 1.4,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                                Text(
                                                  '(${state.results[index].releaseDate.toString().substring(0, 4)})',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      height: 1.4,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
