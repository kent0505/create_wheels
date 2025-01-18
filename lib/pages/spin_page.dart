import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/spin/spin_bloc.dart';
import '../controllers/wheel/wheel_bloc.dart';
import '../data/wheel.dart';
import '../widgets/green_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/wheel_arrow.dart';
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'w600',
                    ),
                  ),
                ),
                SizedBox(height: 54),
                SizedBox(
                  height: 360,
                  child: Stack(
                    children: [
                      BlocBuilder<SpinBloc, SpinState>(
                        builder: (context, state) {
                          return AnimatedRotation(
                            turns: state is SpinStopped ? state.turns : 0,
                            curve: Curves.easeInOutCirc,
                            duration: const Duration(seconds: 10),
                            child: WheelWidget(
                              color: wheel.color,
                              answers: wheel.answers,
                              spin: true,
                            ),
                          );
                        },
                      ),
                      WheelArrow(),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                BlocBuilder<SpinBloc, SpinState>(
                  builder: (context, state) {
                    return Text(
                      state is SpinInitial
                          ? 'Start Spin the Wheel'
                          : state is SpinStopped
                              ? state.answer
                              : '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: state is SpinInitial
                            ? Colors.white
                            : Color(0xff1051E9),
                        fontSize: 32,
                        fontFamily: 'w900',
                      ),
                    );
                  },
                ),
                SizedBox(height: 34),
                BlocBuilder<SpinBloc, SpinState>(
                  builder: (context, state) {
                    return GreenButton(
                      title: 'Spin the Wheel',
                      active: state is SpinInitial ||
                          state is SpinStopped && state.canSpin,
                      onPressed: () {
                        context.read<SpinBloc>().add(StartSpin(wheel: wheel));
                        context.read<WheelBloc>().add(UseWheel(wheel: wheel));
                      },
                    );
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
