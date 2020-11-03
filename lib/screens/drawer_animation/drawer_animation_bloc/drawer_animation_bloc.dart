import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawer_animation_event.dart';
part 'drawer_animation_state.dart';

class DrawerAnimationBloc
    extends Bloc<DrawerAnimationEvent, DrawerAnimationState> {
  DrawerAnimationBloc() : super(DrawerAnimationState.defaultState());

  @override
  Stream<DrawerAnimationState> mapEventToState(
    DrawerAnimationEvent event,
  ) async* {
    if (event is DrawerExpanderEvent) yield* expandEventHandler();
    if (event is DrawerShrinkerEvent) yield* shrinkEventHandler();
  }

  Stream<DrawerAnimationState> expandEventHandler() async* {
    try {
      double xValue = state.xOffset;
      xValue = 230;
      double yValue = state.yOffset;
      yValue = 100;
      double scaleValue = state.scaleFactor;
      scaleValue = 0.7;
      bool open = state.isOpen;
      open = true;

      yield (state.copyWith(
          xOffset: xValue,
          yOffset: yValue,
          scaleFactor: scaleValue,
          isOpen: open));
      print(open);
    } catch (error) {
      print(error);
    }
  }

  Stream<DrawerAnimationState> shrinkEventHandler() async* {
    try {
      yield (state.copyWith(
          xOffset: 0, yOffset: 0, scaleFactor: 1, isOpen: false));
    } catch (error) {
      print(error);
    }
  }
}
