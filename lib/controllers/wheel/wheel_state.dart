part of 'wheel_bloc.dart';

@immutable
sealed class WheelState {}

final class WheelInitial extends WheelState {}

final class WheelsLoaded extends WheelState {
  WheelsLoaded({required this.wheels});

  final List<Wheel> wheels;
}
