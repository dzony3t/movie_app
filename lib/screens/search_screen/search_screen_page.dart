
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/theme/app_text_styles.dart';
import 'package:movie_app_flutter/ui/routes/single_movie_details/movie_details/movie_details.dart';


class SearchScreenPage extends StatelessWidget {
  const SearchScreenPage({this.results});
  final results;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 550,
        child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailsScreen(movie: results[index])));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (results[index].posterPath == null)
                            Container(
                              width: 100.0,
                              height: 140.0,
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
                                width: 100.0,
                                height: 140.0,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w200/" +
                                              results[index].posterPath)),
                                )),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 180,
                                child: Text(
                                  results[index].title == null
                                      ? 'brak polskiego tytułu'
                                      : results[index].title,
                                  maxLines: 2,
                                  style: AppTextStyles.similarMoviesTitlenCast())
                              ),
                              if (results[index].releaseDate == null)
                                Text(
                                  'no release date',
                                  style: AppTextStyles.detailsOverview(),
                                )
                              else
                                Text(
                                  '(${results[index].releaseDate.toString().substring(0, 4)})',
                                  maxLines: 2,
                                  style: AppTextStyles.similarMoviesTitlenCast()
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
    );
  }
}
