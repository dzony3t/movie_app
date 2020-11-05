import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/details_bloc/details_bloc.dart';
import 'movie_details_text_page.dart';

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
    return BlocBuilder(
      cubit: detailsBloc,
      builder: (context, state) {
        if (state.movie == null)
          return Text('...');
        else if (state.movie != null)
          return MovieDetailsTextPage(
            movie: state.movie,
          );
        else
          return _buildErrorWidget();
      },
    );
  }

  Widget _buildErrorWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error"),
      ],
    ));
  }
}
