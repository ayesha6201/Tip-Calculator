import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tip_calculator/tip_calculator.dart';

class SplashScreenView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenViewState();
}

class SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TipCalculatorApp(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.redAccent.shade100,
          child: Center(
              child: Text(
            " CUSTOM TIP\n CALCULATOR",
            style: TextStyle(fontSize: 40),
          )),
        ),
      ),
    );
  }
}
