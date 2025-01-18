import 'package:flutter/material.dart';

import 'svg_widget.dart';

class WheelArrow extends StatelessWidget {
  const WheelArrow({super.key, this.small = false});

  final bool small;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: small ? 12 : 56,
            width: small ? 12 : 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(small ? 0.3 : 0.4),
                  blurRadius: small ? 2 : 10,
                  spreadRadius: 1,
                  offset: Offset(0, small ? 0 : 4),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: SvgWidget(
            'assets/w3.svg',
            height: small ? 18 : null,
          ),
        ),
      ],
    );
  }
}
