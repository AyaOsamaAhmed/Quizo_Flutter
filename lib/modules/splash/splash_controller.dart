import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../onBoarding/main_boarding_screen.dart';


class SplashController extends ControllerMVC {

  static SplashController? _this ;
  factory SplashController(){
    _this  ??= SplashController._();
    return _this!;
  }

  SplashController._();

  double progressValue = 0.0;

  void startProgress() {
    // Timer to update progress every 100 milliseconds
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (progressValue < 1.0) {
          progressValue += 0.02; // Increment progress
        } else {
          timer.cancel(); // Stop the timer when progress is complete
  //        Navigator.pushNamed(context,MainBoardingScreen.routeName);
        }
      });
    });
  }


}