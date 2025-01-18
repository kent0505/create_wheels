import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/wheel/wheel_bloc.dart';
import '../data/utils.dart';
import '../data/wheel.dart';
import '../widgets/button.dart';
import '../widgets/field_widget.dart';
import '../widgets/green_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/svg_widget.dart';

class AnswersPage extends StatefulWidget {
  const AnswersPage({super.key, required this.wheel});

  final Wheel wheel;

  @override
  State<AnswersPage> createState() => _AnswersPageState();
}

class _AnswersPageState extends State<AnswersPage> {
  List<TextEditingController> controllers = [];

  bool active = false;
  bool add = false;

  void onAdd() {
    setState(() {
      controllers.add(TextEditingController());
      controllers.add(TextEditingController());
    });
  }

  void onDelete(int index) {
    if (index >= 2) {
      setState(() {
        controllers.removeAt(index);
        controllers.removeAt(index % 2 == 0 ? index : index - 1);
      });
    }
  }

  void onChanged() {
    setState(() {
      active = controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  void onCreate() {
    widget.wheel.id = getTimestamp();
    widget.wheel.answers = controllers.map((con) => con.text).toList();
    context.read<WheelBloc>().add(UpdateWheels(
          wheel: widget.wheel,
          add: add ? true : false,
          edit: add ? false : true,
        ));
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  void initState() {
    super.initState();
    for (String answer in widget.wheel.answers) {
      controllers.add(TextEditingController(text: answer));
    }
    add = widget.wheel.answers[0].isEmpty;
    onChanged();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              MyAppbar(title: 'Edit Answers'),
              _Add(
                active: controllers.length < 8,
                onPressed: onAdd,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                SizedBox(height: 8),
                Text(
                  'Add a minimum of two answers and a maximum of eight to complete this step.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'w600',
                  ),
                ),
                SizedBox(height: 8),
                ...List.generate(
                  controllers.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: FieldWidget(
                        controller: controllers[index],
                        suffix: index == 0 || index == 1 ? '' : 'delete',
                        onChanged: onChanged,
                        onSuffix: () {
                          onDelete(index);
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 96),
                GreenButton(
                  title: add ? 'Create the Wheel' : 'Edit the Wheel',
                  active: active,
                  onPressed: onCreate,
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

class _Add extends StatelessWidget {
  const _Add({
    required this.active,
    required this.onPressed,
  });

  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8 + MediaQuery.of(context).viewPadding.top,
      right: 16,
      child: Button(
        onPressed: active ? onPressed : null,
        child: Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: active ? Color(0xffAED313) : Color(0xff6B7E90),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: SvgWidget('assets/add.svg'),
          ),
        ),
      ),
    );
  }
}
