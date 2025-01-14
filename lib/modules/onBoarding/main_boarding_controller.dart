
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/assets.dart';
import '../../generated/strings.dart';
import '../../models/boarding_model.dart';

class MainBoardingController extends ControllerMVC{


  factory MainBoardingController(){
    _this ??= MainBoardingController._();
    return _this!;
  }

  static MainBoardingController?  _this;
  MainBoardingController._();

   List<BoardingModel> sliderList = [
    BoardingModel(imageUrl: Assets.boarding1, title: Strings.boarding1),
    BoardingModel(imageUrl: Assets.boarding2, title: Strings.boarding2),
    BoardingModel(imageUrl: Assets.boarding3, title: Strings.boarding3),
  ];

   PageController pageViewController = PageController(initialPage: 0);

  int currentPageIndex = 0;
  int currentIndex = 0;


  timer (){
    Timer.periodic(Duration(seconds: 5), (Timer timer){
      if(currentPageIndex < 2 ){
        currentPageIndex ++;
      }else
        currentPageIndex = 0;

      pageViewController.animateToPage(currentPageIndex,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);



    });
  }

  onPageChanged(int index){
    currentPageIndex = index;
    setState(() {
      currentIndex = index;
    });
  }


  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

}