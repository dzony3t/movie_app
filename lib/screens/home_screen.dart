import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/screens/drawer_animation/drawer_animation_bloc/drawer_animation_bloc.dart';
import 'package:movie_app_flutter/screens/drawer_screen/drawer_screen.dart';
import 'package:movie_app_flutter/screens/search_screen/search_screen.dart';
import 'package:movie_app_flutter/theme/app_colors.dart';
import 'package:movie_app_flutter/theme/app_text_styles.dart';
import 'package:movie_app_flutter/ui/routes/movies_bloc/movies_bloc.dart';
import 'package:movie_app_flutter/ui/routes/movies_by_genre/genres_movies.dart';
import 'package:movie_app_flutter/ui/routes/now_playing/movies_now_playing.dart';
import 'package:movie_app_flutter/ui/routes/top_rated/top_rated.dart';
import 'package:movie_app_flutter/ui/routes/newest/newest_movies.dart';

class Film extends StatefulWidget {
  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Film> {
  MoviesCubit moviesCubit = MoviesCubit();
  DrawerAnimationCubit animationCubit = DrawerAnimationCubit();
  final cubit = DrawerAnimationCubit();
  @override
  void initState() {
    super.initState();
    moviesCubit = MoviesCubit();
    moviesCubit.getUpcomingMovies();
    // animationCubit = DrawerAnimationCubit();
  }

  @override
  void dispose() {
    // moviesBloc.close();
    moviesCubit.close();
    // animationCubit.close();
    super.dispose();
  }

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    // final cubit = context.bloc<DrawerAnimationCubit>();
    return BlocBuilder(
        cubit: moviesCubit,
        builder: (context, state) {
          return Scaffold(
              drawer: DrawerScreen(),
              appBar: buildAppBar(context),
              body: BlocBuilder(
                cubit: cubit,
                builder: (context, stan) {
                  return Stack(
                    children: [
                      DrawerScreen(),
                      GestureDetector(
                        onTap: () {
                        cubit.closeDrawerHandler();
                          // tu zamiast printuj mam cubit.i metoda
                          // animationBloc.add(DrawerShrinkerEvent());
                        },
                        child: AnimatedContainer(
                          transform: Matrix4.translationValues(
                              stan.xOffset, stan.yOffset, 0)
                            ..scale(stan.scaleFactor)
                            ..rotateY(stan.isOpen ? -0.5 : 0),
                          duration: Duration(milliseconds: 250),
                          color: AppColors.mainColor,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              MoviesNowPlaying(
                                movies: state.movies,
                              ),
                              GenresMovies(),
                              TopRatedMovies(),
                              NewestMovies(),
                              // PopularPersons(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ));
        });
  }

  AppBar buildAppBar(BuildContext context) {
    // final cubit = context.bloc<DrawerAnimationCubit>();
    return AppBar(
      leading: BlocBuilder(
        cubit: cubit,
        builder: (context, state) {
          return state.isOpen
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    // animationBloc.add(DrawerShrinkerEvent());
                   cubit.closeDrawerHandler();

                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: state.isOpen == true ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    // animationBloc.add(DrawerExpanderEvent());
                    cubit.expandDrawerHandler();
                    // getIt
                    //     .get<DrawerAnimationCubit>().expandDrawerHandler();
                  },
                );
        },
      ),
      backgroundColor: Colors.grey[900],
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: AppColors.secondColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ),
            );
          },
        )
      ],
      title: Text(
        'MovieApp',
        style: AppTextStyles.detailsTitle(),
      ),
    );
  }
}
