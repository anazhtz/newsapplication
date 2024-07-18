import 'package:flutter/material.dart';
import 'package:newsapplication/core/conts.dart';
import 'package:newsapplication/custom_widgets/cupertino_textfield.dart';
import 'package:newsapplication/custom_widgets/custom_button.dart';
import 'package:newsapplication/custom_widgets/login_or_signup.dart';
import 'package:newsapplication/provider/user_provider.dart';
import 'package:newsapplication/view/loginpage/login_page.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Future<void> handleSignup() async {
      if (_formKey.currentState?.validate() ?? false) {
        final name = nameController.text.trim();
        final email = emailController.text.trim();
        final password = passwordController.text.trim();
        final userProvider = Provider.of<UserProvider>(context, listen: false);

        final result = await userProvider.signUp(
          email: email,
          password: password,
          name: name,
        );
        if (result == "Success") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signup successful')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result ?? 'Signup failed')),
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
                        placeholder: "Name",
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
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
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
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
                buttonText: 'Signup',
                onPressed: handleSignup,
              ),
            ),
          ),
          AskingLoginOrSignup(
            firstText: 'Already have an account? ',
            secondText: 'Login',
            onTap: () {
              Navigator.pushReplacement(
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
