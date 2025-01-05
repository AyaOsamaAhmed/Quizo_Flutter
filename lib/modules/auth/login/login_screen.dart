import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:quizo_flutter/modules/auth/login/login_controller.dart';
import 'package:quizo_flutter/modules/auth/resetPassword/reset_password_screen.dart';
import '../../../generated/strings.dart';
import '../verifyOTP/verify_otp_screen.dart';

class LoginScreen extends StatefulWidget {

  static const routeName = "Login";
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {

  late LoginController  con ;

  _LoginScreenState(): super(LoginController()){
    con =LoginController();
  }


  static const List<Tab> typeAccount = <Tab>[
    Tab(text: Strings.phone_number),
    Tab(text: Strings.email),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(Strings.help , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold ,color: Colors.red),),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:20 , right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(child: Text(Strings.login,style: TextStyle(fontSize: 35 , fontWeight: FontWeight.bold , color: Color(0xFF212121)) )),
            Text(Strings.sub_login,style: TextStyle(fontSize: 15  , color: Color(0xFF9E9E9E)) ),
            DefaultTabController(
              length: 2,
              child:Column(
                children: [
                  TabBar(tabs: typeAccount),
                  SizedBox(
                    height: 500,
                    child: TabBarView(children: [
                         Column(
                          children: [
                              Padding(
                                padding: const EdgeInsets.only(top:25 , left: 10 , right: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: '1234567',
                                      prefixStyle: TextStyle(fontSize: 18 ,),
                                      prefixText: "+02  ",
                                      border: OutlineInputBorder()
                                  ),
                                  autocorrect: true,
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                 style: TextStyle(fontSize: 18,),
                                  controller: con.phone,
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top:25 , left: 10 , right: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'password',
                                    border: OutlineInputBorder()
                                ),
                                autocorrect: true,
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 18,),
                                controller: con.password,
                              ),
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(child: GestureDetector(child: Text(Strings.reset_password ) , onTap: (){
                                    Navigator.pushNamed(context, ResetPasswordScreen.routeName);
                                  },)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: double.infinity, // <-- match_parent
                                height: 60, // <-- match-parent
                                child:  ElevatedButton(   // MaterialButton
                                  onPressed: () =>{
                                    con.onLogIn(context: context)

                                    //    Navigator.pushNamed(context,VerifyOtpScreen.routeName)
                                  }, child: Text(Strings.login)
                                  ,style: ElevatedButton.styleFrom( foregroundColor: Colors.white,
                                    backgroundColor: Color(0xFF4C004D) , textStyle: TextStyle(fontSize: 20) ) ,
                                ),
                              ),
                            ),

                          ],
                                                 ),

                      Column(
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(top:25 , left: 10 , right: 10),
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
                            controller: con.phone,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:25 , left: 10 , right: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'password',
                                border: OutlineInputBorder()
                            ),
                            autocorrect: true,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 18,),
                            controller: con.password,
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(Strings.reset_password ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: double.infinity, // <-- match_parent
                            height: 60, // <-- match-parent
                            child:  ElevatedButton(   // MaterialButton
                              onPressed: () =>{
                                con.onLogIn(context: context)
                         //       Navigator.pushNamed(context,VerifyOtpScreen.routeName)
                              }, child: Text(Strings.login)
                              ,style: ElevatedButton.styleFrom( foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF4C004D) , textStyle: TextStyle(fontSize: 20) ) ,
                            ),
                          ),
                        ),
]
                      ),
                    ]),
                  )
                ],
              )
            )

          ],
        ),
      ),
    );
  }
}
