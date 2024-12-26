import 'package:flutter/material.dart';

class SliderDots extends StatelessWidget {


  bool isActive ;
   SliderDots(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: isActive ? 12 : 8,
        width: isActive ? 12 : 8,
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF4C004D) : Color(0xFFEEEEEE) ,
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),


    );
  }
}
