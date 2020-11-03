import 'package:flutter/material.dart';
import 'package:movie_app_flutter/model/movie.dart';
import 'package:movie_app_flutter/theme/app_text_styles.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/movie_details/movie_details_texts.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/movie_details/movie_details_top_widgdet.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/movie_similar/similar_movies.dart';

import '../movie_cast/movie_cast.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({this.movie});
  //TODO dac tu bloca a wywalic z details_text i tam przekazac tylko co mnie interesuje
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[900]),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsTopWidget(movie: movie),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (movie.title == null)
                      Text('chwilowy brak polskiego tytułu w bazie',
                          style: AppTextStyles.detailsTitle())
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: Text(movie.title,
                            style: AppTextStyles.detailsTitle()),
                      ),
                  ],
                ),
              ),
              MovieDetailsTexts(
                detailsId: movie.id,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_right,
                    color: Colors.orangeAccent,
                    size: 30,
                  ),
                  Text(
                    'Film cast: ',
                    style: AppTextStyles.inMainScreenTitles(),
                  ),
                ],
              ),
              MovieCast(
                castId: movie.id,
              ),
              SimilarMovies(similarId: movie.id),
            ],
          ),
        ),
      ),
    );
  }
}
