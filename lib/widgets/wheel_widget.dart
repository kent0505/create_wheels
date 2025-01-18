import 'package:flutter/material.dart';

import 'svg_widget.dart';

class WheelWidget extends StatelessWidget {
  const WheelWidget({
    super.key,
    required this.color,
    required this.answers,
    this.repaint = false,
    this.dimension = 358,
  });

  final int color;
  final List<String> answers;
  final bool repaint;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension,
        child: Stack(
          children: [
            SvgWidget('assets/w1.svg'),
            Center(
              child: SvgWidget(
                'assets/c$color${answers.length}.svg',
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
