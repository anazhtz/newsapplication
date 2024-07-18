import 'package:flutter/material.dart';
import 'package:newsapplication/core/conts.dart';
import 'package:newsapplication/custom_widgets/cupertino_textfield.dart';
import 'package:newsapplication/custom_widgets/custom_button.dart';
import 'package:newsapplication/custom_widgets/login_or_signup.dart';
import 'package:newsapplication/provider/user_provider.dart';
import 'package:newsapplication/view/home_page/home_page.dart';
import 'package:newsapplication/view/signuppage/sign_up.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Future<void> handleLogin(BuildContext context) async {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      if (_formKey.currentState?.validate() ?? false) {
        final result = await userProvider.signIn(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        if (result == "Success") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to login. $result')),
          );
        }
      }
    }

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
                onPressed: () => handleLogin(context),
              ),
            ),
          ),
          AskingLoginOrSignup(
            firstText: 'New here? ',
            secondText: 'Signup',
            onTap: () {
              Navigator.pushReplacement(
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
