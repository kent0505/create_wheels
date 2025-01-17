import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/wheel/wheel_bloc.dart';
import '../widgets/button.dart';
import '../widgets/dialog_widget.dart';
import '../widgets/my_appbar.dart';
import '../widgets/svg_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppbar(title: 'Settings'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              children: [
                _Button(
                  title: 'Notifications',
                  onPressed: () {},
                ),
                _Button(
                  title: 'Privacy Policy',
                  onPressed: () {},
                ),
                _Button(
                  title: 'Terms of Use',
                  onPressed: () {},
                ),
                _Button(
                  title: 'Share App',
                  onPressed: () {},
                ),
                _Button(
                  title: 'Rate Us',
                  onPressed: () {},
                ),
                _Button(
                  title: 'Clear Data',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogWidget(
                          title: 'Clear data',
                          description:
                              'Are you sure? All saved data will be cleared. Please, confirm your action.',
                          onPressed: () {
                            context.read<WheelBloc>().add(ClearWheels());
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      child: Container(
        height: 56,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Color(0xff07223D),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'w900',
                ),
              ),
            ),
            RotatedBox(
              quarterTurns: 2,
              child: SvgWidget('assets/back.svg'),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
