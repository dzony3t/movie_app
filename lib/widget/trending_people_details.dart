import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PeopleDetails extends StatelessWidget {
  final person;

  const PeopleDetails({Key key, this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Details'),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  person.name,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    'Known for: ${person.knownForDepartment}',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
//                  Text(
//                    'Born: ${person.birthday}',
//                    style: TextStyle(
//                        color: Colors.grey,
//                        fontSize: 15,
//                        fontStyle: FontStyle.italic),
//                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 180,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w300/" +
                                  person.profilePath,
                            )),
                      )),
                ),
//                Container(
//                  width: 150,
//                  child: Text(
//                    person.biography,
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 20
//                    ),
//                  ),
//                ),
              RaisedButton(child: Text('print'),onPressed: (){
                print(person.biography);
              },),
              ],
            )
          ],
        ),
      ),
    );
  }
}
