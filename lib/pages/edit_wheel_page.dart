import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/wheel/wheel_bloc.dart';
import '../data/wheel.dart';
import '../widgets/dialog_widget.dart';
import '../widgets/field_widget.dart';
import '../widgets/green_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/select_color_widget.dart';
import '../widgets/wheel_widget.dart';
import 'answers_page.dart';

class EditWheelPage extends StatefulWidget {
  const EditWheelPage({super.key, required this.wheel});

  final Wheel wheel;

  @override
  State<EditWheelPage> createState() => _EditWheelPageState();
}

class _EditWheelPageState extends State<EditWheelPage> {
  final controller = TextEditingController();
  Wheel wheel = Wheel(
    id: 0,
    title: '',
    color: 3,
    answers: ['', ''],
  );

  void onColor(int value) {
    setState(() {
      wheel.color = value;
    });
  }

  void onTitle() {
    setState(() {
      wheel.title = controller.text;
    });
  }

  void onNext() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AnswersPage(wheel: wheel);
        },
      ),
    );
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          title: 'Delete wheel',
          description: 'Are you sure?',
          left: 'Delete',
          onPressed: () {
            context
                .read<WheelBloc>()
                .add(UpdateWheels(wheel: wheel, delete: true));
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    wheel = widget.wheel;
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
            title: 'Customize Wheel',
            asset: 'delete',
            onPressed: onDelete,
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
