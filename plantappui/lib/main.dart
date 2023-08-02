// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plantappui/UI/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Small Plant Market',
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
