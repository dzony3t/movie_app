import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerState());
  DrawerState get initialState => DrawerState.defaultState();

  @override
  Stream<DrawerState> mapEventToState(
    DrawerEvent event,
  ) async* {
    if (event is NavigationDrawerEvent) yield* getNavigationDrawer(event);
  }

  Stream<DrawerState> getNavigationDrawer(NavigationDrawerEvent event) async* {
    if (event.whereToNavigate != state.selectedPage)
      yield state.copyWith(selectedPage: state.selectedPage);
  }
}
