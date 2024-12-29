import 'package:flutter/material.dart';

import '../../../generated/strings.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = "ResetPassword";
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Center(child: Text(Strings.reset_phone_number , style: TextStyle(fontSize: 20),)),
            Center(child: Text(Strings.sub_reset_phone_number , style: TextStyle(fontSize: 12 , color: Colors.grey),) ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(Strings.help , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold ,color: Colors.red),),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20 , right: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:50),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Aya@gmail.com',
                      labelText: Strings.email_address,
                      border: OutlineInputBorder()
                  ),
                  autocorrect: true,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18,),
                 // controller: con.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                  width: double.infinity, // <-- match_parent
                  height: 60, // <-- match-parent
                  child:  ElevatedButton(   // MaterialButton
                    onPressed: () =>{
                    //  Navigator.pushNamed(context,VerifyOtpScreen.routeName)
                    }, child: Text(Strings.send_code)
                    ,style: ElevatedButton.styleFrom( foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF4C004D) , textStyle: TextStyle(fontSize: 20) ) ,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
