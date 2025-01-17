import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../db/db.dart';
import '../../db/prefs.dart';
import '../../models/wheel.dart';

part 'wheel_event.dart';
part 'wheel_state.dart';

class WheelBloc extends Bloc<WheelEvent, WheelState> {
  final _db = DB();

  WheelBloc() : super(WheelInitial()) {
    on<LoadWheels>((event, emit) async {
      await getPrefs();
      await _db.init();
      List<Wheel> wheels = await _db.getWheels();
      emit(WheelsLoaded(wheels: wheels));
    });

    on<ClearWheels>((event, emit) async {
      await clearPrefs();
      await _db.clearWheels();
      emit(WheelsLoaded(wheels: []));
    });
  }
}
