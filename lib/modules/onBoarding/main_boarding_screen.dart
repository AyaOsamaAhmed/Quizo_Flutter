import 'package:flutter/material.dart';
import '../../generated/strings.dart';
import '../auth/createAccount/create_account_screen.dart';
import '../auth/login/login_screen.dart';
import 'main_boarding_controller.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

import 'on_boarding_item_Screen.dart';

class MainBoardingScreen extends StatefulWidget {


  static const routeName = "MainBoarding";
  const MainBoardingScreen({super.key});

  @override
  State<MainBoardingScreen> createState() => _MainBoardingScreenState();
}

class _MainBoardingScreenState extends State<MainBoardingScreen>  with SingleTickerProviderStateMixin {

  late MainBoardingController  con ;

  late TabController tabController;
  _MainBoardingScreenState(): super(){
    con =MainBoardingController();
  }

@override
  void initState() {
  super.initState();

      tabController = TabController(length: 3, vsync: this);
      con.timer();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,50,20,50),
    child:Column(
      children: [
        Expanded(
          child: OnBoardingAnimation(
              pages: [
                OnBoardingItemScreen(boardingModel: con.sliderList[0]),
                OnBoardingItemScreen(boardingModel: con.sliderList[1]),
                OnBoardingItemScreen(boardingModel: con.sliderList[2]),
              ],
              indicatorDotHeight: 7.0,
              indicatorDotWidth: 7.0,
              indicatorType: IndicatorType.expandingDots,
              indicatorPosition: IndicatorPosition.bottomCenter,
            ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: double.infinity, // <-- match_parent
            height: 60, // <-- match-parent
            child:  ElevatedButton(   // MaterialButton
              onPressed: () =>{
                Navigator.pushNamed(context,LoginScreen.routeName)
              }, child: Text(Strings.login_account)
              ,style: ElevatedButton.styleFrom( foregroundColor: Colors.white,
                backgroundColor: Color(0xFF4C004D) , textStyle: TextStyle(fontSize: 20) ) ,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: double.infinity, // <-- match_parent
            height: 60, // <-- match-parent
            child:  ElevatedButton(   // MaterialButton
              onPressed: () =>{
                Navigator.pushNamed(context,CreateAccountScreen.routeName)
              }, child: Text(Strings.create_account)
              ,style: ElevatedButton.styleFrom( foregroundColor: Colors.black,
                backgroundColor: Color(0xFFEEEEEE), textStyle: TextStyle(fontSize: 20) ) ,
            ),
          ),
        ),
      ],
    )
      )
      /*Padding(
        padding: const EdgeInsets.fromLTRB(20,50,20,0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: con.onPageChanged,
                      controller: con.pageViewController,
                      itemCount: con.sliderList.length,
                      itemBuilder: (ctx,i) =>
                          OnBoardingItemScreen(boardingModel: con.sliderList[i])

              ),
            ),


        Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 20),
          child: DotsIndicator(
            dotsCount:  con.sliderList.length,
            position: con.currentPageIndex.toDouble(),
          )

        /*  Container(
            child:Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              con.sliderList.length,
                (_currentIndex) => InkWell(
                  onTap: (){
                    con.pageViewController.animateToPage(_currentIndex, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  },
                  child: Row(
                    children: [
                      if( _currentIndex == con.currentPageIndex)
                        SliderDots(true)
                      else
                        SliderDots(false)
                    ],

                  ),
                )
            )
            )
          ),*/
          ),


          ]


        ),
      )

    */
    );

  }

  @override
  void dispose() {
    super.dispose();

    tabController.dispose();
  }

}

