import 'package:flutter/material.dart';

import 'button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  final String title;
  final String description;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xff222529),
      child: SizedBox(
        height: 140,
        width: 270,
        child: Column(
          children: [
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'w600',
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'w700',
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 1,
              color: Color(0xff545458).withValues(alpha: 0.65),
            ),
            Row(
              children: [
                _Button(
                  title: 'Clear Data',
                  color: Color(0xffFF3B30),
                  fontFamily: 'w700',
                  onPressed: () {
                    Navigator.pop(context);
                    onPressed();
                  },
                ),
                Container(
                  height: 44,
                  width: 1,
                  color: Color(0xff545458).withValues(alpha: 0.65),
                ),
                _Button(
                  title: 'Cancel',
                  color: Color(0xff0A84FF),
                  fontFamily: 'w600',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.color,
    required this.fontFamily,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final String fontFamily;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Button(
        padding: 0,
        minSize: 44,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }
}
