import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/db.dart';
import '../../data/prefs.dart';
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

    on<AddWheel>((event, emit) async {
      wheels.insert(0, event.wheel);
      await updateWheels();
      emit(WheelsLoaded(wheels: wheels));
    });

    on<ClearWheels>((event, emit) async {
      wheels = [];
      await clearPrefs();
      await updateWheels();
      emit(WheelsLoaded(wheels: wheels));
    });
  }
}
