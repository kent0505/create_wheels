import 'package:flutter/material.dart';

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
            color: Color(0xffA13DFF),
            currentColor: currentColor,
            onPressed: onPressed,
          ),
          SizedBox(width: 16),
          _Button(
            color: Color(0xff12C4FF),
            currentColor: currentColor,
            onPressed: onPressed,
          ),
          SizedBox(width: 16),
          _Button(
            color: Color(0xffAA0003),
            currentColor: currentColor,
            onPressed: onPressed,
          ),
          SizedBox(width: 16),
          _Button(
            color: Color(0xff20EB01),
            currentColor: currentColor,
            onPressed: onPressed,
          ),
          SizedBox(width: 16),
          _Button(
            color: Color(0xffFFAA0B),
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
