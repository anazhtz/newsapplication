import 'package:flutter/material.dart';

import '../core/conts.dart';


class AskingLoginOrSignup extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback onTap;

  const AskingLoginOrSignup({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            text: firstText,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
              fontSize: 15,
            ),
            children: [
              TextSpan(
                text: secondText,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontFamily: "Poppins",
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
