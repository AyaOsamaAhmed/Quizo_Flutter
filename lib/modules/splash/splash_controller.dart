import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SplashController extends ControllerMVC {

  static SplashController? _this ;
  factory SplashController(){
    _this  ??= SplashController._();
    return _this!;
  }

  SplashController._();


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

}