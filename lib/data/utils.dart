import 'dart:ui';

import 'package:intl/intl.dart';

import 'wheel.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

String timestampToString(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('dd.MM.yyyy').format(date);
}

Color getColor(int id) {
  if (id == 1) return Color(0xffA13DFF);
  if (id == 2) return Color(0xff12C4FF);
  if (id == 3) return Color(0xffAA0003);
  if (id == 4) return Color(0xff20EB01);
  if (id == 5) return Color(0xffFFAA0B);
  return Color(0xffA13DFF);
}

List<double> getAngles(int length) {
  if (length == 2) return [.7, .1, .3, .4, .6, .8, .9, .2];
  if (length == 4) return [.1, .4, .6, .9, .16, .32, .57, .82];
  if (length == 6) return [.2, .33, .53, .65, .83, 0, .9, .7];
  return [.1, .3, .44, .55, .7, .8, .92, .2];
}

String getAnswer(Wheel wheel, double angle) {
  if (wheel.answers.length == 2) {
    if (angle == .1) return wheel.answers[0];
    if (angle == .2) return wheel.answers[0];
    if (angle == .3) return wheel.answers[0];
    if (angle == .4) return wheel.answers[0];
    if (angle == .6) return wheel.answers[1];
    if (angle == .7) return wheel.answers[1];
    if (angle == .8) return wheel.answers[1];
    if (angle == .9) return wheel.answers[1];
  }
  if (wheel.answers.length == 4) {
    if (angle == .1) return wheel.answers[0];
    if (angle == .16) return wheel.answers[0];
    if (angle == .9) return wheel.answers[1];
    if (angle == .82) return wheel.answers[1];
    if (angle == .6) return wheel.answers[2];
    if (angle == .57) return wheel.answers[2];
    if (angle == .4) return wheel.answers[3];
    if (angle == .32) return wheel.answers[3];
  }
  if (wheel.answers.length == 6) {
    if (angle == .2) return wheel.answers[0];
    if (angle == .83) return wheel.answers[1];
    if (angle == .9) return wheel.answers[1];
    if (angle == 0) return wheel.answers[2];
    if (angle == .65) return wheel.answers[3];
    if (angle == .7) return wheel.answers[3];
    if (angle == .33) return wheel.answers[4];
    if (angle == .53) return wheel.answers[5];
  }
  if (wheel.answers.length == 8) {
    if (angle == .2) return wheel.answers[0];
    if (angle == .1) return wheel.answers[1];
    if (angle == .92) return wheel.answers[2];
    if (angle == .8) return wheel.answers[3];
    if (angle == .7) return wheel.answers[4];
    if (angle == .55) return wheel.answers[5];
    if (angle == .44) return wheel.answers[6];
    if (angle == .3) return wheel.answers[7];
  }
  return '';
}
