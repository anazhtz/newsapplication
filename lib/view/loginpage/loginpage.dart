import 'package:flutter/material.dart';
import 'package:newsapplication/core/conts.dart';
import 'package:newsapplication/custom_widgets/cupertino_textfield.dart';
import 'package:newsapplication/custom_widgets/custom_button.dart';
import 'package:newsapplication/custom_widgets/login_or_signup.dart';
import 'package:newsapplication/view/signuppage/signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyNews',
          style: TextStyle(
            fontFamily: "PoppinsBold",
            color: AppColors.primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.appColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCupertinoTextField(
                        placeholder: "Email",
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomCupertinoTextField(
                        placeholder: "Password",
                        obscureText: true,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: CustomButton(
                buttonText: 'Login',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform login action
                  }
                },
              ),
            ),
          ),
          AskingLoginOrSignup(
            firstText: 'New here? ',
            secondText: 'Signup',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
