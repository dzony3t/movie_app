import 'package:flutter/material.dart';
import 'package:movie_app_flutter/theme/app_text_styles.dart';
import 'package:movie_app_flutter/ui/routes/page_details/movie_details/movie_details.dart';

class SimilarMoviesPage extends StatelessWidget {
  SimilarMoviesPage({this.similarMovies});

  final similarMovies;

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
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Icon(
                Icons.arrow_right,
                color: Colors.orangeAccent,
                size: 30,
              ),
              Text(
                'Similar Movies',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        if (similarMovies == null)
          Container(
            child: Text(
              'chwilowy brak podobnych filmów w bazie, pracujemy nad tym!',
              style: AppTextStyles.detailsTitle()
            ),
          )
        else
          Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: similarMovies.length,
                itemBuilder: (context, index) {
                  print(similarMovies.length);
                  return Padding(
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                movie: similarMovies[index],
                              ),
                            ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (similarMovies[index].posterPath == null)
                            Container(
                              width: 120.0,
                              height: 180.0,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                                shape: BoxShape.rectangle,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                width: 120.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.0)),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w200/" +
                                              similarMovies[index].posterPath)),
                                )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 100,
                            child: Text(
                              similarMovies[index].title == null
                                  ? 'brak polskiego tytułu'
                                  : similarMovies[index].title,
                              maxLines: 2,
                              style: AppTextStyles.similarMoviesTitlenCast(),
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
