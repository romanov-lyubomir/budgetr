import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? suffixText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffix: suffixText != null ? Text(' $suffixText') : null,
      ),
      style: TextStyle(
        color: Theme.of(context).inputDecorationTheme.labelStyle!.color,
      ),
      maxLength: 50,
      keyboardType:
          suffixText != null ? TextInputType.number : TextInputType.text,
    );
  }
}
