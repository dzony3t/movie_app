import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/ui/routes/page_details/movie_similar/similar_bloc/similar_bloc.dart';
import 'package:movie_app_flutter/ui/routes/page_details/movie_similar/similar_movie_page.dart';
import 'package:movie_app_flutter/ui/view/loading_view/loading_view.dart';
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
        if (state.similarMovies != null) {
          return SimilarMoviesPage(similarMovies: state.similarMovies,);
        } else if (state.similarMovies == null)
          return LoadingView();
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