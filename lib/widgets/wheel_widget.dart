import 'package:flutter/material.dart';

import 'svg_widget.dart';

class WheelWidget extends StatelessWidget {
  const WheelWidget({
    super.key,
    required this.color,
    this.dimension = 358,
  });

  final Color color;
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
              child: Container(
                height: 320,
                width: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CustomPaint(
                  painter: CirclePainter(
                    segments: 4,
                    color: color,
                  ),
                ),
              ),
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

class CirclePainter extends CustomPainter {
  CirclePainter({
    required this.segments,
    required this.color,
  });

  final int segments;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final double sweepAngle = 2 * 3.141592653589793 / segments;

    for (int i = 0; i < segments; i++) {
      paint.color = (i % 2 == 0) ? color : Colors.white;
      final segmentStartAngle = 3.141592653589793 / 2 + i * sweepAngle;
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
