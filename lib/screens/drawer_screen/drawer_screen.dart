import 'package:flutter/material.dart';
import 'package:movie_app_flutter/screens/drawer_navigation_screen/drawer_screen_detail.dart';
import 'package:movie_app_flutter/screens/favourite_screen/movie_favourite/movie_favourite.dart';


class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.grey[900],
          child: ListView(
      children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Movie App created by dzony3t',
                      style: TextStyle(
                        color: Colors.white, fontSize: 30
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          DrawerNavigationButton(
            title: 'O nas',
            icon: Icons.person,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrawerScreenDetail(
                    pageText: Text('Strona w budowie'),
                  ),
                ),
              );
            },
          ),
          DrawerNavigationButton(
            title: 'My List',
            icon: Icons.movie,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieFavourite(),
                ),
              );
            },
          ),
          DrawerNavigationButton(
            title: 'Ustawienia',
            icon: Icons.settings,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrawerScreenDetail(
                    pageText: Text('Tu beda ustawienia'),
                  ),
                ),
              );
            },
          ),
      ],
    ),
        ));
  }
}

class DrawerNavigationButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final IconData icon;
  final String numberOfFavMovies;
  DrawerNavigationButton({this.title, this.onTap, this.icon, this.numberOfFavMovies});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
      child: Builder(
        builder: (BuildContext context) => ListTile(
            title: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            leading: Icon(
              icon,
              color: Colors.black,
            ),
            onTap: onTap,),
      ),
    );
  }
}
