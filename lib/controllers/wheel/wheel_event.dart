part of 'wheel_bloc.dart';

@immutable
sealed class WheelEvent {}

class LoadWheels extends WheelEvent {}

class ClearWheels extends WheelEvent {}
