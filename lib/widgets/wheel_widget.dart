import 'package:flutter/material.dart';

import '../data/utils.dart';
import 'degree_widget.dart';
import 'svg_widget.dart';
import 'wheel_arrow.dart';

class WheelWidget extends StatelessWidget {
  const WheelWidget({
    super.key,
    required this.color,
    required this.answers,
    this.repaint = false,
    this.small = false,
    this.spin = false,
  });

  final int color;
  final List<String> answers;
  final bool repaint;
  final bool small;
  final bool spin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: small ? 80 : 358,
        child: Stack(
          children: [
            SvgWidget(
              'assets/w1.svg',
              height: small ? 80 : null,
            ),
            Center(
              child: SvgWidget(
                'assets/c$color${answers.length}.svg',
                height: small ? 72 : null,
              ),
            ),
            Center(
              child: SvgWidget(
                'assets/w2.svg',
                height: small ? 72 : null,
              ),
            ),
            if (!spin) WheelArrow(small: small),
            if (answers[0].isNotEmpty) ...[
              if (answers.length == 2) ...[
                _Answers(
                  answer1: answers[0],
                  answer2: answers[1],
                  color2: getColor(color),
                  small: small,
                ),
              ] else if (answers.length == 4) ...[
                _Answers(
                  answer1: answers[0],
                  answer2: answers[2],
                  degree: 44,
                  color1: getColor(color),
                  color2: getColor(color),
                  small: small,
                ),
                _Answers(
                  answer1: answers[1],
                  answer2: answers[3],
                  degree: 133,
                  small: small,
                ),
              ] else if (answers.length == 6) ...[
                _Answers(
                  answer1: answers[0],
                  answer2: answers[3],
                  degree: 30,
                  color2: getColor(color),
                  small: small,
                ),
                _Answers(
                  answer1: answers[1],
                  answer2: answers[4],
                  degree: 150,
                  color2: getColor(color),
                  small: small,
                ),
                _Answers(
                  answer1: answers[2],
                  answer2: answers[5],
                  degree: 90,
                  color1: getColor(color),
                  small: small,
                ),
              ] else if (answers.length == 8) ...[
                _Answers(
                  answer1: answers[0],
                  answer2: answers[4],
                  degree: 23,
                  color1: getColor(color),
                  color2: getColor(color),
                  small: small,
                ),
                _Answers(
                  answer1: answers[1],
                  answer2: answers[5],
                  degree: 67,
                  small: small,
                ),
                _Answers(
                  answer1: answers[2],
                  answer2: answers[6],
                  degree: 113,
                  color1: getColor(color),
                  color2: getColor(color),
                  small: small,
                ),
                _Answers(
                  answer1: answers[3],
                  answer2: answers[7],
                  degree: 156,
                  small: small,
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

class _Answers extends StatelessWidget {
  const _Answers({
    required this.answer1,
    required this.answer2,
    this.color1 = Colors.white,
    this.color2 = Colors.white,
    this.degree = 0,
    this.small = false,
  });

  final String answer1;
  final String answer2;
  final Color color1;
  final Color color2;
  final int degree;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DegreeWidget(
        degree: degree,
        child: SizedBox(
          width: small ? 60 : 280,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedBox(
                quarterTurns: 0,
                child: SizedBox(
                  width: small ? 24 : 100,
                  child: Text(
                    answer1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: color1,
                      fontSize: small ? 4 : 16,
                      fontFamily: 'w900',
                      height: 1,
                    ),
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 0,
                child: SizedBox(
                  width: small ? 24 : 100,
                  child: Text(
                    answer2,
                    textAlign: TextAlign.end,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: color2,
                      fontSize: small ? 4 : 16,
                      fontFamily: 'w900',
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
