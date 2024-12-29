import 'package:flutter/material.dart';
import 'package:quizo_flutter/modules/auth/createAccount/create_account_controller.dart';

import '../../../generated/strings.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../verifyOTP/verify_otp_screen.dart';


class CreateAccountScreen extends StatefulWidget {

  static const routeName = "CreateAccount";
  const CreateAccountScreen({super.key});

  @override
  State createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends StateMVC<CreateAccountScreen> {

  late CreateAccountController  con ;

  _CreateAccountScreenState(): super(CreateAccountController()){
    con =CreateAccountController();
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
            Text(Strings.create_account,style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold , color: Color(0xFF212121)),),
            SizedBox(child: Text(Strings.sub_create_account,style: TextStyle(fontSize: 15, color: Color(0xFF9E9E9E)) ,  )),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: DefaultTabController(
            length: 2,
            child:Column(
              children: [
                TabBar(tabs: typeAccount),
                SizedBox(
                  height: 600,
                  child: TabBarView(children: [
                    Column(
                      children: [
                        Padding(
                        padding: const EdgeInsets.only(top:25 , left: 10 , right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                              width: 150,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Aya',
                                    border: OutlineInputBorder(),
                                  labelText: Strings.first_name

                                ),
                                autocorrect: true,
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 18,),
                                controller: con.firstName,
                              ),
                            ),

                              SizedBox(
                                width: 150,
                                child:  TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Osama',
                                      border: OutlineInputBorder(),
                                      labelText: Strings.last_name
                                  ),
                                  autocorrect: true,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 18,),
                                  controller: con.lastName,
                                ),
                              )
                            ],
                          ),
                          ),


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
                                hintText: 'Password',
                                border: OutlineInputBorder()
                            ),
                            autocorrect: true,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 18,),
                            controller: con.password,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:25 , left: 10 , right: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                border: OutlineInputBorder()
                            ),
                            autocorrect: true,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 18,),
                            controller: con.confirmPassword,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: double.infinity, // <-- match_parent
                            height: 60, // <-- match-parent
                            child:  ElevatedButton(   // MaterialButton
                              onPressed: () =>{
                                Navigator.pushNamed(context,VerifyOtpScreen.routeName)
                              }, child: Text(Strings.create_account)
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Aya',
                                        border: OutlineInputBorder(),
                                        labelText: Strings.first_name

                                    ),
                                    autocorrect: true,
                                    autofocus: true,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(fontSize: 18,),
                                    controller: con.firstName,
                                  ),
                                ),

                                SizedBox(
                                  width: 150,
                                  child:  TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Osama',
                                        border: OutlineInputBorder(),
                                        labelText: Strings.last_name
                                    ),
                                    autocorrect: true,
                                    autofocus: true,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(fontSize: 18,),
                                    controller: con.lastName,
                                  ),
                                )
                              ],
                            ),
                          ),

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
                                  hintText: 'Password',
                                  border: OutlineInputBorder()
                              ),
                              autocorrect: true,
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 18,),
                              controller: con.password,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:25 , left: 10 , right: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  border: OutlineInputBorder()
                              ),
                              autocorrect: true,
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 18,),
                              controller: con.confirmPassword,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              width: double.infinity, // <-- match_parent
                              height: 60, // <-- match-parent
                              child:  ElevatedButton(   // MaterialButton
                                onPressed: () =>{
                                  Navigator.pushNamed(context,VerifyOtpScreen.routeName)
                                }, child: Text(Strings.create_account)
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

          ),
        )
          ],
        ),
      ),
    );
  }
}
