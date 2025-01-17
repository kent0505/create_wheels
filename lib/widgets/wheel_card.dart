import 'package:flutter/material.dart';

import '../data/utils.dart';
import '../data/wheel.dart';
import 'button.dart';

class WheelCard extends StatelessWidget {
  const WheelCard({
    super.key,
    required this.wheel,
  });

  final Wheel wheel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      decoration: BoxDecoration(
        color: Color(0xff07223D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Button(
        onPressed: () {},
        child: Column(
          children: [
            SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    wheel.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'w900',
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Last Used',
                  style: TextStyle(
                    color: Color(0xff6B7E90),
                    fontSize: 10,
                    fontFamily: 'w400',
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  timestampToString(wheel.id),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'w400',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
