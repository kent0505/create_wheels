import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/wheel/wheel_bloc.dart';
import '../data/wheel.dart';
import '../widgets/green_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/wheel_widget.dart';
import 'edit_wheel_page.dart';

class SpinPage extends StatelessWidget {
  const SpinPage({super.key, required this.wheel});

  final Wheel wheel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppbar(
            title: 'Created Wheel',
            asset: 'edit',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditWheelPage(wheel: wheel);
                  },
                ),
              );
            },
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff07223D),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    wheel.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'w600',
                    ),
                  ),
                ),
                SizedBox(height: 54),
                WheelWidget(
                  color: wheel.color,
                  answers: wheel.answers,
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    'Start Spin the Wheel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'w900',
                    ),
                  ),
                ),
                SizedBox(height: 34),
                GreenButton(
                  title: 'Spin the Wheel',
                  onPressed: () {
                    context.read<WheelBloc>().add(UseWheel(wheel: wheel));
                  },
                ),
                SizedBox(height: 42),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
