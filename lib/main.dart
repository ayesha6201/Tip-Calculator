import 'package:flutter/material.dart';
import 'package:tip_calculator/splash.dart';
import 'package:tip_calculator/tip_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreenView(),
    );
  }
}