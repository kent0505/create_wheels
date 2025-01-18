import 'package:flutter/material.dart';

import 'svg_widget.dart';

class WheelWidget extends StatelessWidget {
  const WheelWidget({
    super.key,
    required this.color,
    required this.answers,
    this.repaint = false,
  });

  final int color;
  final List<String> answers;
  final bool repaint;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 358,
        child: Stack(
          children: [
            SvgWidget('assets/w1.svg'),
            Center(
              child: SvgWidget(
                'assets/c$color${answers.isEmpty ? 2 : answers.length}.svg',
              ),
            ),
            Center(child: SvgWidget('assets/w2.svg')),
            Center(child: SvgWidget('assets/w3.svg')),
          ],
        ),
      ),
    );
  }
}
