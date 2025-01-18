part of 'wheel_bloc.dart';

@immutable
sealed class WheelEvent {}

class LoadWheels extends WheelEvent {}

class UpdateWheels extends WheelEvent {
  UpdateWheels({
    required this.wheel,
    this.add = false,
    this.edit = false,
    this.delete = false,
    this.clear = false,
  });

  final Wheel wheel;
  final bool add;
  final bool edit;
  final bool delete;
  final bool clear;
}

class ClearWheels extends WheelEvent {}
