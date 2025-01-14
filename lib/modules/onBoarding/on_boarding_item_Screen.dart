import 'package:flutter/material.dart';
import '../../models/boarding_model.dart';

class OnBoardingItemScreen extends StatelessWidget {

  static const routeName = "OnBoarding1";
  final BoardingModel boardingModel ;

  const OnBoardingItemScreen({super.key , required this.boardingModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Column(
          children: [
            Text(boardingModel.title,style:
            TextStyle(fontSize: 35 , fontWeight: FontWeight.bold , color: Color(0xFF212121)),),
            SizedBox(width: double.infinity, height: 200,),
            Image.asset(boardingModel.imageUrl),

          ],
      ),
    );
  }
}
