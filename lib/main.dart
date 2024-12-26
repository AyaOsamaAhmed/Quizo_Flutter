import 'package:flutter/material.dart';
import 'package:quizo_flutter/modules/auth/createAccount/create_account_screen.dart';
import 'package:quizo_flutter/modules/auth/login/login_screen.dart';
import 'package:quizo_flutter/modules/auth/verifyOTP/verify_otp_screen.dart';
import 'package:quizo_flutter/modules/onBoarding/main_boarding_screen.dart';
import 'package:quizo_flutter/modules/splash/splash_screen.dart';

import 'modules/onBoarding/on_boarding_item_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
 /*     theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),*/
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName :(context) => SplashScreen() ,
          MainBoardingScreen.routeName :(context) => MainBoardingScreen() ,
          LoginScreen.routeName :(context) => LoginScreen() ,
          CreateAccountScreen.routeName :(context) => CreateAccountScreen() ,
          VerifyOtpScreen.routeName :(context) => VerifyOtpScreen() ,


        }

    );
  }
}
