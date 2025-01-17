import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/wheel/wheel_bloc.dart';
import '../widgets/loading_widget.dart';
import 'home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WheelBloc, WheelState>(
      listener: (context, state) {
        if (state is WheelsLoaded) {
          Future.delayed(
            const Duration(seconds: 2),
            () {
              if (context.mounted) {
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                }
              }
            },
          );
        }
      },
      child: Scaffold(
        body: LoadingWidget(),
      ),
    );
  }
}
