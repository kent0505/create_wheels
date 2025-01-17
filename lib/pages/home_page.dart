import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/wheel/wheel_bloc.dart';
import '../widgets/green_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/wheel_card.dart';
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
                child: BlocBuilder<WheelBloc, WheelState>(
                  builder: (context, state) {
                    if (state is WheelsLoaded) {
                      return GridView.builder(
                        padding: EdgeInsets.all(8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio:
                              MediaQuery.of(context).size.width / (2 * 186),
                        ),
                        itemCount: state.wheels.length,
                        itemBuilder: (context, index) {
                          return WheelCard(
                            wheel: state.wheels[index],
                          );
                        },
                      );
                    }

                    return Container();
                  },
                ),
              ),
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
