import 'package:hive_flutter/hive_flutter.dart';

import 'wheel.dart';

List<Wheel> wheels = [];

Future<void> initHive() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('create_wheels_box');
  Hive.registerAdapter(WheelAdapter());
}

Future<void> getWheels() async {
  final box = await Hive.openBox('create_wheels_box');
  List data = box.get('wheels') ?? [];
  wheels = data.cast<Wheel>();
}

Future<void> updateWheels() async {
  final box = await Hive.openBox('create_wheels_box');
  box.put('wheels', wheels);
  wheels = await box.get('wheels');
}
