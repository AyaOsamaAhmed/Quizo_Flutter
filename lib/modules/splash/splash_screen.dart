import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../generated/assets.dart';
import '../onBoarding/main_boarding_screen.dart';

class SplashScreen extends StatefulWidget {

  static const routeName = "Splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {


  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {
        if(animationController.value > 0.9)
             Navigator.pushNamed(context,MainBoardingScreen.routeName);
      });
    });
  //  animationController
    animationController.repeat(reverse: false);

    super.initState();
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
                  value: animationController.value,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
