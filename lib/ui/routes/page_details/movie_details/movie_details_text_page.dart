import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_flutter/theme/app_text_styles.dart';

import 'overview_details.dart';

class MovieDetailsTextPage extends StatelessWidget {
  const MovieDetailsTextPage({this.movie});

  final movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text('(${movie.releaseDate.substring(0, 4)})',
                  style: AppTextStyles.firstDetailsOfMovie()),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text('${movie.runtime.toString()} min',
                  style: AppTextStyles.firstDetailsOfMovie()),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text(movie.adult == false ? 'PG13' : 'R',
                  style: AppTextStyles.firstDetailsOfMovie()),
            ),
            RatingBar(
              onRatingUpdate: null,
              itemSize: 20.0,
              initialRating: movie.voteAverage / 2,
              direction: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ),
            Column(
              children: [
                RichText(
                  text: TextSpan(
                      text: movie.voteAverage.toString(),
                      style: AppTextStyles.detailsOverview(),
                      children: <TextSpan>[
                        TextSpan(
                            text: '/10',
                            style: AppTextStyles.detailsOverview())
                      ]),
                ),
                Text(
                  movie.voteCount.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 1.0,
          width: double.infinity,
          color: Colors.grey,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 180,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: movie.posterPath != null
                      ? Container(
                          alignment: Alignment.bottomCenter,
                          height: 170,
                          width: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/original/' +
                                      movie.posterPath,
                                )),
                          ))
                      : Container(
                    width: 100,
                        child: Text(
                            'theres no poster',
                            style: AppTextStyles.detailsOverview(),
                          ),
                      )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (movie.overview.length > 0)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OverviewDetails(
                                      details: movie,
                                    )));
                      },
                      child: Container(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: movie.overview.length > 80
                              ? Text(
                                  movie.overview != null
                                      ? movie.overview.substring(0, 80) + "..."
                                      : '...',
                                  style: AppTextStyles.detailsOverview(),
                                )
                              : Text(
                                  movie.overview != null
                                      ? movie.overview
                                      : '...',
                                  style: AppTextStyles.detailsOverview(),
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
                            color: Colors.white,
                          ),
                        )),
                  Container(
                      width: 200,
                      height: 35.0,
                      padding: EdgeInsets.only(right: 10.0, top: 5.0),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.genres.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    border: Border.all(
                                        width: 1.0, color: Colors.white)),
                                child: Text(
                                  movie.genres[index].name,
                                  maxLines: 2,
                                  style: AppTextStyles.genresDetails(),
                                ),
                              ),
                            );
                          }))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
