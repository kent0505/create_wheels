import 'package:flutter/material.dart';

import '../data/utils.dart';
import 'button.dart';

class SelectColorWidget extends StatelessWidget {
  const SelectColorWidget({
    super.key,
    required this.color,
    required this.onPressed,
  });

  final int color;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Button(
            id: 1,
            color: color,
            onPressed: onPressed,
          ),
          _Button(
            id: 2,
            color: color,
            onPressed: onPressed,
          ),
          _Button(
            id: 3,
            color: color,
            onPressed: onPressed,
          ),
          _Button(
            id: 4,
            color: color,
            onPressed: onPressed,
          ),
          _Button(
            id: 5,
            color: color,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.color,
    required this.onPressed,
  });

  final int id;
  final int color;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    final active = id == color;

    return Button(
      onPressed: active
          ? null
          : () {
              onPressed(id);
            },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        height: active ? 52 : 44,
        width: active ? 52 : 44,
        margin: EdgeInsets.symmetric(horizontal: active ? 4 : 8),
        decoration: BoxDecoration(
          color: intToColor(id),
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
