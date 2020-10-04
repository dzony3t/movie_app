
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/theme/app_text_styles.dart';

class PersonDetailsPage extends StatelessWidget {
  const PersonDetailsPage({
    this.persons
  });

  final persons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Container(
                child: Text(
                  persons.name,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: Text(
                  'Known for: ${persons.knownForDepartment}',
                  style: AppTextStyles.firstDetailsOfMovie(),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 5),
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 180,
                      width: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w300/" +
                                    persons.profilePath)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (persons.biography.length > 0)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Scaffold(
                                      backgroundColor: Colors.black,
                                      appBar: AppBar(backgroundColor: Colors.black,),
                                      body: SafeArea(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            child: Text(persons.biography, style: AppTextStyles.detailsOverview(),),
                                          ),
                                        ),
                                      ),
                                    )));
                          },
                          child: Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5),
                              child:
                              persons.biography.length > 180
                                  ? Text(
                                persons.biography
                                    .substring(0, 180) +
                                    "...",
                                style: AppTextStyles.detailsOverview(),
                              )
                                  : Text(
                                persons.biography,
                                style: AppTextStyles.detailsOverview()
                              ),
                            ),
                          ),
                        )
                      else
                        Container(
                            width: 200,
                            child: const Text(
                              'There is no biography of current person you are looking for, but we are working on it! ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          child: Text(
                            'Born: ${persons.birthday.toString()}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.white, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
