import 'package:flutter/material.dart';

import 'svg_widget.dart';

class WheelWidget extends StatelessWidget {
  const WheelWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 358,
        child: Stack(
          children: [
            SvgWidget('assets/w1.svg'),
            CircleDivider(
              strings: ['a', 'b', 'c', 'd', 'e', 'f'],
              color: color,
            ),
            Center(
              child: SvgWidget('assets/w2.svg'),
            ),
            Center(
              child: SvgWidget('assets/w3.svg'),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleDivider extends StatelessWidget {
  const CircleDivider({
    super.key,
    required this.strings,
    required this.color,
  });

  final List<String> strings;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 320,
        width: 320,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CustomPaint(
          painter: CirclePainter(
            segments: strings.length,
            color: color,
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter({
    required this.segments,
    required this.color,
    this.startAngle = 3.141592653589793 / 2, // Default start from the left
  });

  final int segments;
  final Color color;
  final double startAngle; // Allows custom start position

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final double sweepAngle = 2 * 3.141592653589793 / segments;

    for (int i = 0; i < segments; i++) {
      paint.color = (i % 2 == 0) ? color : Colors.white;
      final segmentStartAngle = startAngle + i * sweepAngle;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        segmentStartAngle,
        sweepAngle,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
