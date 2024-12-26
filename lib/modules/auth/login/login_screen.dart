import 'package:flutter/material.dart';

import '../../../generated/strings.dart';

class LoginScreen extends StatefulWidget {

  static const routeName = "Login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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


          ],
        ),
      ),
    );
  }
}
