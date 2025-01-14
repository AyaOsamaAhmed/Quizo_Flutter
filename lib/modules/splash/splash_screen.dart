import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizo_flutter/modules/splash/splash_controller.dart';
import '../../generated/assets.dart';
import '../onBoarding/main_boarding_screen.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {

  static const routeName = "Splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double progressValue = 0.0;

//  SplashController con  = SplashController();

  @override
  void initState() {
    super.initState();

    startProgress();

  }

   void startProgress() {
     // Timer to update progress every 100 milliseconds
     Timer.periodic(Duration(milliseconds: 100), (timer) {
       setState(() {
         if (progressValue < 1.0) {
           progressValue += 0.02; // Increment progress
         } else {
           timer.cancel(); // Stop the timer when progress is complete
           Navigator.pushNamed(context,MainBoardingScreen.routeName);
         }
       });
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment :MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.splash),

            Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,0),
              child: SizedBox(
              height: 5,
                width: 140,
                child: LinearProgressIndicator(
                  backgroundColor: Color(0xFFEEEEEE),
                  color: Color(0xFF4C004D) ,
                  value: progressValue,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
