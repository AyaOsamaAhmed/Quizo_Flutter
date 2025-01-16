import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:quizo_flutter/modules/auth/login/login_data_handler.dart';

import '../../../utilities/toast_helper.dart';
import '../../Splash/splash_screen.dart';
import '../verifyOTP/verify_otp_screen.dart';


class LoginController extends ControllerMVC {


  factory LoginController(){
    _this ??= LoginController._();
    return _this!;
  }

  static LoginController?  _this;
  LoginController._();

  late TextEditingController phone ;
  String code = "20";

  @override
  void initState() {
    phone = TextEditingController();

    super.initState();
  }



  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  Future sendPhoneOtp({required BuildContext context}) async {
    setState(() {});
    final result = await LoginDataHandeler.sendPhoneOtp(phone: phone.text , code: code);
    result.fold((l) {
      ToastHelper.showError(message: l.errorModel.statusMessage);
    }, (r) async{
      if(context.mounted){
        print("${r.data}");
        Navigator.pushNamed(context,VerifyOtpScreen.routeName,
            arguments: {'phone': '${phone.text}' , 'code' : '20' , 'page' :'login'});
      }
    });
  }




}