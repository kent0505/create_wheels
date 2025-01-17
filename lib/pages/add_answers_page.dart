import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/field_widget.dart';
import '../widgets/green_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/svg_widget.dart';

class AddAnswersPage extends StatefulWidget {
  const AddAnswersPage({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  State<AddAnswersPage> createState() => _AddAnswersPageState();
}

class _AddAnswersPageState extends State<AddAnswersPage> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  bool active = false;

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

  void onCreate() {}

  @override
  void dispose() {
    for (TextEditingController controller in controllers) {
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
                  title: 'Create the Wheel',
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
