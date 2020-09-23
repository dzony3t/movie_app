import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/person_bloc/person_bloc.dart';

class PopularPersons extends StatefulWidget {
  @override
  _PopularPersonsState createState() => _PopularPersonsState();
}

class _PopularPersonsState extends State<PopularPersons> {
  PersonBloc personBloc = PersonBloc();

  @override
  void initState() {
    super.initState();
    personBloc = PersonBloc();
    personBloc.add(GetPersonsEvent());
  }

  @override
  void dispose() {
    personBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: personBloc,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_right,
                    color: Colors.orangeAccent,
                    size: 30,
                  ),
                  Text(
                    'Trending people this week:',
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
                  itemCount: state.persons.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('dzia');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          state.persons[index].profilePath == null
                              ? Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Hero(
                                    tag: state.persons[index].id,
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Icon(
                                        Icons.supervised_user_circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Hero(
                                    tag: state.persons[index].id,
                                    child: Container(
                                        width: 70.0,
                                        height: 70.0,
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/w300/" +
                                                      state.persons[index]
                                                          .profilePath)),
                                        )),
                                  ),
                                ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            state.persons[index].name,
                            maxLines: 3,
                            style: TextStyle(
                                height: 1.4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}
