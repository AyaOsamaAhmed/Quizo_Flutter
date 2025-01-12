import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizo_flutter/models/boarding_model.dart';
import 'package:quizo_flutter/modules/auth/createAccount/create_account_screen.dart';
import 'package:quizo_flutter/modules/auth/login/login_screen.dart';
import 'package:quizo_flutter/modules/onBoarding/slider_dots.dart';
import 'dart:async';
import '../../generated/strings.dart';
import 'on_boarding_item_Screen.dart';

class MainBoardingScreen extends StatefulWidget {


  static const routeName = "MainBoarding";
  const MainBoardingScreen({super.key});

  @override
  State<MainBoardingScreen> createState() => _MainBoardingScreenState();
}

class _MainBoardingScreenState extends State<MainBoardingScreen>   with TickerProviderStateMixin{

  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  int _currentIndex = 0;


  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(
      initialPage: 0
    );
    _tabController = TabController(length: 3, vsync: this);
    Timer.periodic(Duration(seconds: 5), (Timer timer){
      if(_currentPageIndex < 2 ){
        _currentPageIndex ++;
      }else
        _currentPageIndex = 0;

      _pageViewController.animateToPage(_currentPageIndex,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

    });
  }
  _onPageChanged(int index){
    _currentPageIndex = index;
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,50,20,0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: _onPageChanged,
                      controller: _pageViewController,
                      itemCount: BoardingModel.sliderList.length,
                      itemBuilder: (ctx,i) =>
                          OnBoardingItemScreen(index: i)

              ),
            ),

          SizedBox(
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
        Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 20),
          child: Container(
            child:Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              BoardingModel.sliderList.length,
                (_currentIndex) => InkWell(
                  onTap: (){
                    _pageViewController.animateToPage(_currentIndex,
                        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  },
                  child: Row(
                    children: [
                      if( _currentIndex == _currentPageIndex)
                        SliderDots(true)
                      else
                        SliderDots(false)
                    ],

                  ),
                )
            )
            )
          ),
          ),


          ]


        ),
      )
    );

  }
  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

}

