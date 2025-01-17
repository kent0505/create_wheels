import 'package:flutter/material.dart';

import '../data/utils.dart';
import 'button.dart';

class SelectColorWidget extends StatelessWidget {
  const SelectColorWidget({
    super.key,
    required this.currentColor,
    required this.onPressed,
  });

  final Color currentColor;
  final void Function(Color) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Button(
            color: intToColor(1),
            currentColor: currentColor,
            onPressed: onPressed,
          ),
          SizedBox(width: 16),
          _Button(
            color: intToColor(2),
            currentColor: currentColor,
            onPressed: onPressed,
          ),
          SizedBox(width: 16),
          _Button(
            color: intToColor(3),
            currentColor: currentColor,
            onPressed: onPressed,
          ),
          SizedBox(width: 16),
          _Button(
            color: intToColor(4),
            currentColor: currentColor,
            onPressed: onPressed,
          ),
          SizedBox(width: 16),
          _Button(
            color: intToColor(5),
            currentColor: currentColor,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.color,
    required this.currentColor,
    required this.onPressed,
  });

  final Color color;
  final Color currentColor;
  final void Function(Color) onPressed;

  @override
  Widget build(BuildContext context) {
    final active = color == currentColor;

    return Button(
      onPressed: active
          ? null
          : () {
              onPressed(color);
            },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        height: active ? 52 : 44,
        width: active ? 52 : 44,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(active ? 12 : 8),
        ),
        child: Center(
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 4,
                color: active ? Colors.white : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
