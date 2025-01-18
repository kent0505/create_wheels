import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/spin/spin_bloc.dart';
import '../data/utils.dart';
import '../data/wheel.dart';
import '../pages/spin_page.dart';
import 'button.dart';
import 'wheel_widget.dart';

class WheelCard extends StatelessWidget {
  const WheelCard({super.key, required this.wheel});

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
        onPressed: () {
          context.read<SpinBloc>().add(ResetSpin());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SpinPage(wheel: wheel);
              },
            ),
          );
        },
        child: Column(
          children: [
            SizedBox(height: 16),
            WheelWidget(
              color: wheel.color,
              answers: wheel.answers,
              small: true,
            ),
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
                      // height: 1.5,
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
