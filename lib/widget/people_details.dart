import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/person_bloc/person_bloc.dart';

class PeopleDetails extends StatefulWidget {
  final personId;
  const PeopleDetails({Key key, this.personId});
  @override
  _CastDetailState createState() => _CastDetailState();
}

class _CastDetailState extends State<PeopleDetails> {
  PersonBloc personBloc = PersonBloc();

  @override
  void initState() {
    super.initState();
    personBloc = PersonBloc();
    personBloc.add(GetPersonsEvent(id: widget.personId));
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
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.black,),
          backgroundColor: Colors.black,
          body: SafeArea(
            child: (state.persons == null)
                ? Container(
                        child: CircularProgressIndicator(),
                      )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Container(
                          child: Text(
                            state.persons.name,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          child: Text(
                            'Known for: ${state.persons.knownForDepartment}',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontStyle: FontStyle.italic),
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
                                              state.persons.profilePath)),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (state.persons.biography.length > 0)
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
                                                      child: Text(state.persons.biography, style: TextStyle(color: Colors.white, fontSize: 15),),
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
                                            state.persons.biography.length > 180
                                                ? Text(
                                                    state.persons.biography
                                                            .substring(0, 180) +
                                                        "...",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    state.persons.biography,
                                                    style: TextStyle(
                                                        color: Colors.white),
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
                                      'Born: ${state.persons.birthday.toString()}',
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
      },
    );
  }
}
