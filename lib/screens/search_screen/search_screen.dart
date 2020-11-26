import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/screens/search_screen/search_bloc/search_bloc.dart';
import 'package:movie_app_flutter/screens/search_screen/search_screen_view.dart';
import 'package:movie_app_flutter/theme/app_colors.dart';

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
    if (_searchQuery.text.length < 3)
      return;
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


  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: searchBloc,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.darkGrey,
          appBar: AppBar(
            backgroundColor: AppColors.darkGrey
          ),
          body: Column(
            children: [
              Form(
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
                    ),
                    if (state.results == null)
                      Container(child: Text('...'))
                    else
                      SearchScreenView(
                        results: state.results,
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
