import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/wheel/wheel_bloc.dart';
import '../widgets/green_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/no_wheels.dart';
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
                      if (state.wheels.isEmpty) return NoWheels();

                      return ListView(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          SizedBox(height: 4),
                          Text(
                            'Your Created Wheels',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'w600',
                            ),
                          ),
                          SizedBox(height: 12),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                          ),
                          SizedBox(height: 100),
                        ],
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
