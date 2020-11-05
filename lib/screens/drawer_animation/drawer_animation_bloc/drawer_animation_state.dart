part of 'drawer_animation_bloc.dart';

class DrawerAnimationState extends Equatable {
  const DrawerAnimationState(
      {this.scaleFactor, this.isOpen, this.yOffset, this.xOffset});

  final double xOffset;
  final double yOffset;
  final double scaleFactor;

  factory DrawerAnimationState.defaultState() => DrawerAnimationState(xOffset: 0, yOffset: 0, scaleFactor: 1, isOpen: false);
  final bool isOpen;
  @override
  List<Object> get props => [xOffset, yOffset, scaleFactor, isOpen];

  DrawerAnimationState copyWith(
      {double xOffset, double yOffset, double scaleFactor, bool isOpen}) {
    return DrawerAnimationState(
      xOffset: xOffset ?? this.xOffset,
      yOffset: yOffset ?? this.yOffset,
      scaleFactor: scaleFactor ?? this.scaleFactor,
      isOpen: isOpen ?? this.isOpen,
    );
  }
}
