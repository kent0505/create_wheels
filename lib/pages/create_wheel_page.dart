import 'package:flutter/material.dart';

import '../widgets/field_widget.dart';
import '../widgets/green_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/select_color_widget.dart';
import '../widgets/wheel_widget.dart';
import 'add_answers_page.dart';

class CreateWheelPage extends StatefulWidget {
  const CreateWheelPage({super.key});

  @override
  State<CreateWheelPage> createState() => _CreateWheelPageState();
}

class _CreateWheelPageState extends State<CreateWheelPage> {
  final controller = TextEditingController();
  Color color = Color(0xffAA0003);

  void onColor(Color value) {
    setState(() {
      color = value;
    });
  }

  void onTitle() {
    setState(() {});
  }

  void onNext() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddAnswersPage(
            title: controller.text,
            color: color,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppbar(title: 'Create Wheel'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                SizedBox(height: 8),
                Text(
                  'Select a color for your wheel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'w600',
                  ),
                ),
                SizedBox(height: 8),
                WheelWidget(color: color),
                SizedBox(height: 16),
                SelectColorWidget(
                  currentColor: color,
                  onPressed: onColor,
                ),
                SizedBox(height: 16),
                Text(
                  'Type your question to continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'w600',
                  ),
                ),
                SizedBox(height: 8),
                FieldWidget(
                  controller: controller,
                  maxLines: 4,
                  onChanged: onTitle,
                  onSuffix: () {
                    controller.clear();
                  },
                ),
                SizedBox(height: 66),
                GreenButton(
                  title: 'Next',
                  active: controller.text.isNotEmpty,
                  onPressed: onNext,
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
