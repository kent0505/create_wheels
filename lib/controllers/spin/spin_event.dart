part of 'spin_bloc.dart';

@immutable
sealed class SpinEvent {}

class StartSpin extends SpinEvent {
  StartSpin({required this.wheel});

  final Wheel wheel;
}

class ResetSpin extends SpinEvent {}
