import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoTextField extends StatelessWidget {
  final String placeholder;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const CustomCupertinoTextField({
    super.key,
    required this.placeholder,
    this.obscureText = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: CupertinoColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      validator: validator,
    );
  }
}
