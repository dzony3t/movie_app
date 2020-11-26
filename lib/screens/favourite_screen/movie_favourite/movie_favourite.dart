import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/app/configure_getIt.dart';
import 'package:movie_app_flutter/screens/favourite_screen/favourite_bloc.dart';
import 'package:movie_app_flutter/theme/app_colors.dart';
import 'package:movie_app_flutter/theme/app_text_styles.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/movie_details/movie_details.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/movie_details/overview_details.dart';
import 'package:movie_app_flutter/screens/favourite_screen/favourite_event.dart';
class MovieFavourite extends StatefulWidget {
  @override
  _MovieFavouriteState createState() => _MovieFavouriteState();
}

final favBloc = getIt.get<FavouriteBloc>();

class _MovieFavouriteState extends State<MovieFavourite> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: favBloc,
      builder: (context, state){
        return Scaffold(
          backgroundColor: AppColors.darkGrey,
          appBar: AppBar(backgroundColor: AppColors.darkGrey),
          body: SafeArea(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 0),
                child: ListView.builder(
                  itemCount: favBloc.state.movies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                movie: favBloc.state.movies[index],
                              )),
                        );
                      },
                      child: Stack(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 15,
                            color: AppColors.darkGrey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (favBloc
                                        .state.movies[index].posterPath ==
                                        null)
                                      Container(
                                        width: 100.0,
                                        height: 140.0,
                                        decoration: BoxDecoration(
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
                                                        favBloc
                                                            .state
                                                            .movies[index]
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
                                            width: 150,
                                            child: Text(
                                                favBloc.state.movies[index]
                                                    .title ==
                                                    null
                                                    ? 'brak polskiego tytułu'
                                                    : favBloc.state
                                                    .movies[index].title,
                                                maxLines: 2,
                                                style: AppTextStyles
                                                    .favTitleDetail())),
                                        if (favBloc.state.movies[index]
                                            .releaseDate ==
                                            null)
                                          Text(
                                            'no release date',
                                            style:
                                            AppTextStyles.favTitleDetail(),
                                          )
                                        else
                                          Text(
                                              '(${favBloc.state.movies[index].releaseDate.toString().substring(0, 4)})',
                                              maxLines: 2,
                                              style: AppTextStyles
                                                  .favTitleDetail()),
                                        if (favBloc.state.movies[index].overview
                                            .length >
                                            0)
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OverviewDetails(
                                                            details: favBloc
                                                                .state
                                                                .movies[index],
                                                          )));
                                            },
                                            child: Container(
                                              width: 200,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: favBloc
                                                    .state
                                                    .movies[index]
                                                    .overview
                                                    .length >
                                                    80
                                                    ? Text(
                                                  favBloc
                                                      .state
                                                      .movies[
                                                  index]
                                                      .overview !=
                                                      null
                                                      ? favBloc
                                                      .state
                                                      .movies[
                                                  index]
                                                      .overview
                                                      .substring(
                                                      0, 80) +
                                                      "..."
                                                      : '...',
                                                  style: AppTextStyles
                                                      .detailsOverview(),
                                                )
                                                    : Text(
                                                  favBloc
                                                      .state
                                                      .movies[
                                                  index]
                                                      .overview !=
                                                      null
                                                      ? favBloc
                                                      .state
                                                      .movies[index]
                                                      .overview
                                                      : '...',
                                                  style: AppTextStyles
                                                      .detailsOverview(),
                                                ),
                                              ),
                                            ),
                                          )
                                        else
                                          Container(
                                              width: 200,
                                              child: const Text(
                                                'Sorry, there is no description of this film right now.',
                                                style: TextStyle(
                                                  color: AppColors.secondColor,
                                                ),
                                              )),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  getIt
                                      .get<FavouriteBloc>()
                                      .add(DeleteFavouriteMovie(index: index));
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5, right: 10,
                              child:  Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow,),
                              Text(favBloc.state.movies[index].rating.toString(), style: AppTextStyles.favTitleDetail(),),
                            ],
                          ))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
