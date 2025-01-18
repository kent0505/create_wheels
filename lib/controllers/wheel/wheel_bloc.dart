import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/db.dart';
import '../../data/prefs.dart';
import '../../data/utils.dart';
import '../../data/wheel.dart';

part 'wheel_event.dart';
part 'wheel_state.dart';

class WheelBloc extends Bloc<WheelEvent, WheelState> {
  WheelBloc() : super(WheelInitial()) {
    on<LoadWheels>((event, emit) async {
      await getPrefs();
      await initHive();
      await getWheels();
      emit(WheelsLoaded(wheels: wheels));
    });

    on<UpdateWheels>((event, emit) async {
      if (event.add) {
        log('ADD');
        wheels.insert(0, event.wheel);
      } else if (event.delete) {
        log('DELETE');
        wheels.removeWhere((element) => element.id == event.wheel.id);
      } else if (event.edit) {
        log('EDIT');
        final wheel = wheels.singleWhere(
          (element) => element.id == event.wheel.id,
        );
        wheel.title = event.wheel.title;
        wheel.color = event.wheel.color;
        wheel.answers = event.wheel.answers;
      }
      await updateWheels();
      emit(WheelsLoaded(wheels: wheels));
    });

    on<ClearWheels>((event, emit) async {
      wheels = [];
      await clearPrefs();
      await updateWheels();
      emit(WheelsLoaded(wheels: wheels));
    });

    on<UseWheel>((event, emit) async {
      final wheel = wheels.singleWhere(
        (element) => element.id == event.wheel.id,
      );
      wheel.id = getTimestamp();
      await updateWheels();
      emit(WheelsLoaded(wheels: wheels));
    });
  }
}
