import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controllers/spin/spin_bloc.dart';
import 'controllers/wheel/wheel_bloc.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WheelBloc()..add(LoadWheels())),
        BlocProvider(create: (context) => SpinBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xff03111D),
          useMaterial3: false,
        ),
        home: SplashPage(),
      ),
    );
  }
}

// dart pub global activate fvm
// fvm install 3.24.2
// fvm use 3.24.2 --force
