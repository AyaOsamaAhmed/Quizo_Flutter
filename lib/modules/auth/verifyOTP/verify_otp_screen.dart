import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizo_flutter/modules/auth/verifyOTP/verify_otp_controller.dart';

import '../../../generated/strings.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:mvc_pattern/mvc_pattern.dart';



class VerifyOtpScreen extends StatefulWidget {

  static const routeName = "VerifyOtp";
  const VerifyOtpScreen({super.key});

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends StateMVC<VerifyOtpScreen> {

  late VerifyOtpController  con ;

  _VerifyOtpScreenState () : super(VerifyOtpController()){
    con =VerifyOtpController();
  }


  int progressValue = 60;

  @override
  void initState() {
    super.initState();

    startProgress();
  }
  void startProgress() {
    // Timer to update progress every 800 milliseconds
    Timer.periodic(Duration(milliseconds: 800), (timer) {
      setState(() {
        if (progressValue > 0) {
          progressValue -= 1; // Increment progress

        } else {
          timer.cancel(); // Stop the timer when progress is complete

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;


     con.phone = "${args['phone']}";
     con.code = "${args['code']}";
     con.page = "${args['page']}";



    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Center(child: Text(Strings.verification_code)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(Strings.help , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold ,color: Colors.red),),
          )
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100 , bottom: 50),
            child: OtpTextField(
              numberOfFields: 6,
              margin:	EdgeInsets.only(right: 20.0),
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                /* showDialog( context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Text("Verification Code"),
                                    content: Text('Code entered is $verificationCode'),
                                  ); }
                );*/
                con.otp = verificationCode;
              /*  if(con.page == 'login' ) {

                  con.onLogIn(context: context);
                }*/

              }, // end onSubmit
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20 , left: 20 , right: 20),
            child: SizedBox(
              width: double.infinity, // <-- match_parent
              height: 60, // <-- match-parent
              child:  ElevatedButton(   // MaterialButton
                onPressed: () =>{
                    if(con.page == 'login' )
                      con.onLogIn(context: context)
                
                }, child: Text(Strings.verify)
                ,style: ElevatedButton.styleFrom( foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF4C004D) , textStyle: TextStyle(fontSize: 20) ) ,
              ),
            ),
          ),
          if(progressValue > 0)
          Padding(
            padding: const EdgeInsets.only(top: 20 ,left: 20 , right: 20),
            child: SizedBox(
              width: double.infinity, // <-- match_parent
              height: 60, // <-- match-parent
              child:  ElevatedButton(   // MaterialButton
                onPressed: () =>{
                }, child: Text("${Strings.resend_code} $progressValue")
                ,style: ElevatedButton.styleFrom( foregroundColor: Colors.grey,
                  backgroundColor: Color(0xFFE0E0E0) , textStyle: TextStyle(fontSize: 20) ) ,
              ),
            ),
          ),
        if(progressValue == 0 )
          Padding(
            padding: const EdgeInsets.only(top: 20 ,left: 20 , right: 20),
            child: SizedBox(
              width: double.infinity, // <-- match_parent
              height: 60, // <-- match-parent
              child:  ElevatedButton(   // MaterialButton
                onPressed: () =>{
                  con.onSendPhoneOTP(context: context)
                }, child: Text("${Strings.resend_code}")
                ,style: ElevatedButton.styleFrom( foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF4C004D) , textStyle: TextStyle(fontSize: 20) ) ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
