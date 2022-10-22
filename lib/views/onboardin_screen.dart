import 'package:blood_donor/utilis/responsive/responsive.dart';
import 'package:blood_donor/utilis/widgets/custom_button.dart';
import 'package:blood_donor/views/auth_views/login_view.dart';
import 'package:blood_donor/views/auth_views/signup_view.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = '/onboarding';
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome \nto Blood Camps',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  text: 'Log in',
                ),
              ),
              CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                  text: 'Sign Up'),
            ],
          ),
        ),
      ),
    );
  }
}
