part of 'spin_bloc.dart';

@immutable
sealed class SpinState {}

final class SpinInitial extends SpinState {}

final class SpinStopped extends SpinState {
  SpinStopped({
    required this.turns,
    this.answer = '',
    this.canSpin = false,
  });

  final double turns;
  final String answer;
  final bool canSpin;
}
