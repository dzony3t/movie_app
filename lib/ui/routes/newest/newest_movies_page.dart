
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/theme/app_colors.dart';
import 'package:movie_app_flutter/theme/app_text_styles.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/movie_details/movie_details.dart';
import 'package:movie_app_flutter/ui/view/succes_page_view/succes_page_view.dart';

class NewestMoviesPage extends StatelessWidget {
  const NewestMoviesPage({this.movies});
  final movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1.0,
          width: double.infinity,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Icon(
                Icons.arrow_right,
                color: AppColors.iconColor,
                size: 30,
              ),
              Text(
                'Najnowsze filmy',
                style: AppTextStyles.inMainScreenTitles(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                  EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              movie: movies[index],
                            )),
                      );
                    },
                    child: Column(
                      children: [
                        SuccesPageView(
                          movies: movies[index],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Container(
                            child: Text(
                              movies[index].releaseDate.toString(),
                              style: AppTextStyles.rating(),
                            ),
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
  }
}
