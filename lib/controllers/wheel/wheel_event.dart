part of 'wheel_bloc.dart';

@immutable
sealed class WheelEvent {}

class LoadWheels extends WheelEvent {}

class AddWheel extends WheelEvent {
  AddWheel({required this.wheel});

  final Wheel wheel;
}

class ClearWheels extends WheelEvent {}
