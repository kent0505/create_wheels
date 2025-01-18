import 'package:flutter/material.dart';

import '../data/wheel.dart';
import '../widgets/field_widget.dart';
import '../widgets/green_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/select_color_widget.dart';
import '../widgets/wheel_widget.dart';
import 'add_answers_page.dart';

class CreateWheelPage extends StatefulWidget {
  const CreateWheelPage({super.key, this.wheel});

  final Wheel? wheel;

  @override
  State<CreateWheelPage> createState() => _CreateWheelPageState();
}

class _CreateWheelPageState extends State<CreateWheelPage> {
  final controller = TextEditingController();
  Wheel wheel = Wheel(
    id: 0,
    title: '',
    color: 3,
    answers: [],
  );

  void onColor(int value) {
    setState(() {
      wheel.color = value;
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
            color: wheel.color,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.wheel != null) wheel = widget.wheel!;
    controller.text = wheel.title;
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
          MyAppbar(
            title: wheel.title.isEmpty ? 'Create Wheel' : 'Customize Wheel',
          ),
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
                WheelWidget(
                  color: wheel.color,
                  answers: wheel.answers,
                  repaint: true,
                ),
                SizedBox(height: 16),
                SelectColorWidget(
                  color: wheel.color,
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
                    onTitle();
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
