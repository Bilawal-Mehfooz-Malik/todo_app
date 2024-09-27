import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final int? maxLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    this.label,
    required this.controller,
    this.maxLines,
    this.hintText,
    this.maxLength,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
