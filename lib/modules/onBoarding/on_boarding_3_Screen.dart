import 'package:flutter/material.dart';
import 'package:quizo_flutter/utilities/size_extension.dart';

import '../../generated/assets.dart';
import '../../generated/strings.dart';
import '../../widgets/custom_button_widget.dart';

class OnBoarding3Screen extends StatefulWidget {

  static const routeName = "OnBoarding3";

  const OnBoarding3Screen({super.key});

  @override
  State<OnBoarding3Screen> createState() => _OnBoarding3ScreenState();
}

class _OnBoarding3ScreenState extends State<OnBoarding3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,50,20,0),
        child: Column(
            children: [
              Text(Strings.boarding3 ,style:
              TextStyle(fontSize: 35 , fontWeight: FontWeight.bold , color: Color(0xFF212121)),),
              SizedBox(width: double.infinity, height: 200,),
              Image.asset(Assets.boarding3),
              SizedBox(width: double.infinity, height: 100,),

              SizedBox(
                width: double.infinity, // <-- match_parent
                height: 60, // <-- match-parent
                child:  ElevatedButton(   // MaterialButton
                  onPressed: () =>(){}, child: Text(Strings.login_account)
                  ,style: ElevatedButton.styleFrom( foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF4C004D) , textStyle: TextStyle(fontSize: 20) ) ,
                ),
              ),
              SizedBox(width: double.infinity, height: 10,),

              SizedBox(
                width: double.infinity, // <-- match_parent
                height: 60, // <-- match-parent
                child:  ElevatedButton(   // MaterialButton
                  onPressed: () =>(){}, child: Text(Strings.create_account)
                  ,style: ElevatedButton.styleFrom( foregroundColor: Colors.black,
                    backgroundColor: Color(0xFFEEEEEE), textStyle: TextStyle(fontSize: 20) ) ,
                ),
              ),


              /*  CustomButtonWidget.primary(
                width: 320.w,
                height: 56.h,
                radius: 12.r,
                title: Strings.login_account,
                onTap: () {
                },
              ),
            */
            ],
        ),
      ),
    );
  }
}
