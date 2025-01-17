import 'package:flutter/material.dart';

import 'button.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    super.key,
    required this.title,
    this.active = true,
    this.horizontal = 16,
    this.bottom = 0,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final double horizontal;
  final double bottom;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 56,
      margin: EdgeInsets.symmetric(
        horizontal: horizontal,
      ).copyWith(bottom: bottom),
      decoration: BoxDecoration(
        color: active ? Color(0xffAED313) : Color(0xff6B7E90),
        borderRadius: BorderRadius.circular(56),
      ),
      child: Button(
        onPressed: active ? onPressed : null,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xff03111D),
              fontSize: 20,
              fontFamily: 'w900',
            ),
          ),
        ),
      ),
    );
  }
}
