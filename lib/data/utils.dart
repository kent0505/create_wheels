import 'dart:ui';

import 'package:intl/intl.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

String timestampToString(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('dd.MM.yyyy').format(date);
}

int colorToInt(Color color) {
  if (color == Color(0xffA13DFF)) return 1;
  if (color == Color(0xff12C4FF)) return 2;
  if (color == Color(0xffAA0003)) return 3;
  if (color == Color(0xff20EB01)) return 4;
  if (color == Color(0xffFFAA0B)) return 5;
  return 1;
}

Color intToColor(int id) {
  if (id == 1) return Color(0xffA13DFF);
  if (id == 2) return Color(0xff12C4FF);
  if (id == 3) return Color(0xffAA0003);
  if (id == 4) return Color(0xff20EB01);
  if (id == 5) return Color(0xffFFAA0B);
  return Color(0xffA13DFF);
}
