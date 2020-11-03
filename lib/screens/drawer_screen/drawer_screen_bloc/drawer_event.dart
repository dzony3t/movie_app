part of 'drawer_bloc.dart';

abstract class DrawerEvent extends Equatable {
  const DrawerEvent();
}


class NavigationDrawerEvent extends DrawerEvent{

  final DrawerPages whereToNavigate;

  NavigationDrawerEvent({this.whereToNavigate});
  @override
  List<Object> get props => [whereToNavigate];


}