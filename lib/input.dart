import 'package:flutter/material.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.hint, required this.controller, this.maxLines = 1});
  final TextEditingController controller;
  final int maxLines;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: progressbarColor),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
