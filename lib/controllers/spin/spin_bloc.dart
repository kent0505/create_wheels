import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/utils.dart';
import '../../data/wheel.dart';

part 'spin_event.dart';
part 'spin_state.dart';

class SpinBloc extends Bloc<SpinEvent, SpinState> {
  double turns = 0.0;

  SpinBloc() : super(SpinInitial()) {
    on<ResetSpin>((event, emit) {
      turns = 0;
      emit(SpinStopped(turns: turns));
      emit(SpinInitial());
    });

    on<StartSpin>((event, emit) async {
      int len = event.wheel.answers.length;
      Random random = Random();
      int randomIndex = random.nextInt(getAngles(len).length);
      double angle = getAngles(len)[randomIndex];
      turns += 6;
      emit(SpinStopped(turns: turns + angle));
      await Future.delayed(Duration(seconds: 10), () {
        emit(SpinStopped(
          turns: turns + getAngles(len)[randomIndex],
          answer: getAnswer(event.wheel, angle),
          canSpin: true,
        ));
      });
    });
  }
}
