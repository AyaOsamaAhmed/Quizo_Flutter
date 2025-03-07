import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../utilities/toast_helper.dart';
import '../../Splash/splash_screen.dart';
import '../../home/home_screen.dart';
import 'verify_otp_data_handler.dart';


class VerifyOtpController extends ControllerMVC {


  factory VerifyOtpController(){
    _this ??= VerifyOtpController._();
    return _this!;
  }

  static VerifyOtpController?  _this;
  VerifyOtpController._();


  String code = ""  , phone = ""  , page = ""  , otp = "" ;

  bool loading = false ;
  Future onSendPhoneOTP({required BuildContext context}) async {
    setState(() {
      loading = true;
    });
    final result = await VerifyOtpDataHandler.sendPhoneOTP(code: code , phoneNumber: phone);
    result.fold((l) {
      ToastHelper.showError(message: l.errorModel.statusMessage);
    }, (r) async{
      if(context.mounted){
        ToastHelper.showError(message: "Success Resent Code  ");
      }
    });
  }

  Future onLogIn({required BuildContext context}) async {
    setState(() {
      loading = true;
    });
    final result = await VerifyOtpDataHandler.login(phone: phone ,otp: otp );
    result.fold((l) {
      ToastHelper.showError(message: l.errorModel.statusMessage);
      onReset();
    }, (r) async{
      if(context.mounted){
        ToastHelper.showError(message: "Success login ");
        Navigator.pushNamed(context,HomeScreen.routeName);
      }
    });
  }
  onReset() {
    loading = false;
  }


}