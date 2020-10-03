import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SuccesPageView extends StatelessWidget {
  final movies;

  SuccesPageView({this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (movies.posterPath == null)
          Container(
            width: 120.0,
            height: 180.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
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
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://image.tmdb.org/t/p/w200/" +
                        movies.posterPath)),
              )),
        SizedBox(
          height: 10.0,
        ),
        if (movies.title.length > 20)
          Container(
            width: 100,
            child: Text(
              movies.title == null
                  ? 'brak polskiego tytułu'
                  : movies.title.toString().substring(0, 20) + '...',
              maxLines: 2,
              style: TextStyle(
                  height: 1.4,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          )
        else
          Container(
            width: 100,
            child: Text(
              movies.title == null ? 'brak polskiego tytułu' : movies.title,
              maxLines: 2,
              style: TextStyle(
                  height: 1.4,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              movies.rating.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5.0,
            ),
            RatingBar(
              itemSize: 15.0,
              initialRating: movies.rating / 2,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
          ],
        )
      ],
    );
  }
}
