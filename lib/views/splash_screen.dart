import 'dart:async';

import 'package:blood_donor/views/onboardin_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        (() => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: ((context) => const OnBoardingScreen())))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text(
      'W E L C O M E',
      style: TextStyle(fontSize: 30),
    )));
  }
}
