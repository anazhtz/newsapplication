import 'package:flutter/material.dart';
import 'package:newsapp/core/conts.dart';
import 'package:newsapp/custome_widgets/cupertinotextfiled_custom.dart';
import 'package:newsapp/custome_widgets/custombutton.dart';
import 'package:newsapp/custome_widgets/login_or_signup.dart';
import 'package:newsapp/view/loginpage/loginpage.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCupertinoTextField(
                      placeholder: "Name",
                      controller: nameController,
                    ),
                    const SizedBox(height: 20),
                    CustomCupertinoTextField(
                      placeholder: "Email",
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomCupertinoTextField(
                      placeholder: "Password",
                      obscureText: true,
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: CustomButton(
                buttonText: 'Signup',
                onPressed: () {},
              ),
            ),
          ),
          AskingLoginOrSignup(
            firstText: 'Already have an account? ',
            secondText: 'Login',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
