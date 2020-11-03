part of 'drawer_bloc.dart';

class DrawerState extends Equatable {

  const DrawerState({this.selectedPage});
  final DrawerPages selectedPage;

  factory DrawerState.defaultState() => DrawerState(selectedPage: null);

  @override
  List<Object> get props => [this.selectedPage];

  DrawerState copyWith({DrawerPages selectedPage}) {
    return DrawerState(selectedPage: selectedPage ?? this.selectedPage);
  }
}

enum DrawerPages {
  about_us,
  settings,
  help,
  similar_apps,
  based_on,
}
