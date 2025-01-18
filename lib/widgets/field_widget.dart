import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'button.dart';
import 'svg_widget.dart';

class FieldWidget extends StatelessWidget {
  const FieldWidget({
    super.key,
    required this.controller,
    this.maxLines = 1,
    this.suffix = 'clear',
    required this.onChanged,
    required this.onSuffix,
  });

  final TextEditingController controller;
  final int maxLines;
  final String suffix;
  final void Function() onChanged;
  final void Function() onSuffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: maxLines == 1 ? null : TextInputType.multiline,
      minLines: 1,
      maxLines: maxLines,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLines == 1 ? 30 : 80),
      ],
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'w600',
      ),
      decoration: InputDecoration(
        suffixIcon: suffix.isEmpty
            ? null
            : Button(
                onPressed: onSuffix,
                child: SizedBox(
                  width: 52,
                  child: Center(
                    child: SvgWidget('assets/$suffix.svg'),
                  ),
                ),
              ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        hintText: 'Question',
        hintStyle: TextStyle(
          color: Color(0xff6B7E90),
          fontSize: 16,
          fontFamily: 'w600',
        ),
        fillColor: Color(0xff092B4C),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xff1051E9),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        onChanged();
      },
    );
  }
}
