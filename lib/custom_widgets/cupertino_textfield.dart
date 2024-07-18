import 'package:flutter/cupertino.dart';

class CustomCupertinoTextField extends StatelessWidget {
  final String placeholder;
  final bool obscureText;
  final TextEditingController controller;

  const CustomCupertinoTextField({
    super.key,
    required this.placeholder,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      obscureText: obscureText,
      placeholderStyle: const TextStyle(
        fontFamily: 'Poppins',
        color: Color.fromARGB(243, 16, 15, 15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
