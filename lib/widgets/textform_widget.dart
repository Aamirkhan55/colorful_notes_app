import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final int? maxLines;
  final double? fontSize;
  final String hintText;
  final TextEditingController controller;

  const TextForm(
      {super.key,
      this.maxLines,
      this.fontSize,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }
}
