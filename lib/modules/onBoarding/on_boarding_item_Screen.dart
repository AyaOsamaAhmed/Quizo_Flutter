import 'package:flutter/material.dart';
import '../../models/boarding_model.dart';

class OnBoardingItemScreen extends StatefulWidget {

  static const routeName = "OnBoarding1";
  final int index ;

  const OnBoardingItemScreen({super.key , required this.index});

  @override
  State<OnBoardingItemScreen> createState() => _OnBoardingItemScreenState(index);
}

class _OnBoardingItemScreenState extends State<OnBoardingItemScreen> {
    final int index ;
    _OnBoardingItemScreenState(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Text(BoardingModel.sliderList[index].title,style:
            TextStyle(fontSize: 35 , fontWeight: FontWeight.bold , color: Color(0xFF212121)),),
            SizedBox(width: double.infinity, height: 200,),
            Image.asset(BoardingModel.sliderList[index].imageUrl),

          ],
      ),
    );
  }
}
