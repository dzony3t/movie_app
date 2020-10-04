import 'package:flutter/material.dart';
import 'package:movie_app_flutter/theme/app_text_styles.dart';
import 'package:movie_app_flutter/ui/routes/page_details/person_details/people_details.dart';

class MovieCastPage extends StatelessWidget {
  const MovieCastPage({this.movieCast});
  final movieCast;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      padding: EdgeInsets.only(left: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieCast.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 10.0, right: 8.0),
            width: 100.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonDetails(
                              personId: movieCast[index].id,
                            )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  movieCast[index].profilePath == null
                      ? Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Icon(
                            Icons.movie,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w300/" +
                                        movieCast[index].profilePath)),
                          )),
                  SizedBox(
                    height: 10.0,
                  ),
                  if (movieCast[index].name == null)
                    Container(
                      child: Text(
                        'Noname',
                        style: AppTextStyles.similarMoviesTitlenCast(),
                      ),
                    )
                  else
                    Text(
                      movieCast[index].name,
                      maxLines: 2,
                      style: AppTextStyles.similarMoviesTitlenCast(),
                    ),
                  SizedBox(
                    height: 3.0,
                  ),
                  movieCast[index].character == null
                      ? Text(
                          'xxx',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      : Text(
                          movieCast[index].character,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.similarMoviesTitlenCast()
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
