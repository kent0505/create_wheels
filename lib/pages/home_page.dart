import 'package:flutter/material.dart';

import '../widgets/green_button.dart';
import '../widgets/my_appbar.dart';
import 'create_wheel_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              MyAppbar(
                title: 'Fortune Wheels',
                home: true,
              ),
              Expanded(
                child: ListView(
                  children: [],
                ),
              ),
              // CircleDivider(
              //   strings: ['aaa', 'bbb', 'ccc', 'ddd', 'eee', 'fff', 'ggg', 'hhh'],
              // ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GreenButton(
              title: 'Create New Wheel',
              bottom: 42,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CreateWheelPage();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
