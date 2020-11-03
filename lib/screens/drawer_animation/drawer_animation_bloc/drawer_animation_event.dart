part of 'drawer_animation_bloc.dart';

abstract class DrawerAnimationEvent extends Equatable {
  const DrawerAnimationEvent();
}

class DrawerExpanderEvent extends DrawerAnimationEvent{
  @override

  List<Object> get props => [];
}

class DrawerShrinkerEvent extends DrawerAnimationEvent{
  @override
  List<Object> get props => [];

}