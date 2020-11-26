import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/app/configure_getIt.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/details_cubit/details_bloc.dart';
import 'movie_details_text_page.dart';

class MovieDetailsTexts extends StatefulWidget {
  final int detailsId;
  const MovieDetailsTexts({Key key, this.detailsId});
  @override
  _MovieDetailsTextsState createState() => _MovieDetailsTextsState();
}

class _MovieDetailsTextsState extends State<MovieDetailsTexts> {
  // DetailsBloc detailsBloc = DetailsBloc();
DetailsCubit detailsCubit = DetailsCubit();
final cubit = getIt.get<DetailsCubit>();
  @override
  void initState() {
    super.initState();
    // detailsBloc = DetailsBloc();
    // detailsBloc.add(GetDetails(id: widget.detailsId));
    detailsCubit.getDetails(id: widget.detailsId);
    cubit.getDetails(id: widget.detailsId);
  }

  @override
  void dispose() {
    // detailsBloc.close();
    detailsCubit.close();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: detailsCubit,
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
