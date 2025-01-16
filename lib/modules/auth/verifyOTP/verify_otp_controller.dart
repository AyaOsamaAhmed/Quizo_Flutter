import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../utilities/toast_helper.dart';
import '../../Splash/splash_screen.dart';
import 'verify_otp_data_handler.dart';


class VerifyOtpController extends ControllerMVC {


  factory VerifyOtpController(){
    _this ??= VerifyOtpController._();
    return _this!;
  }

  static VerifyOtpController?  _this;
  VerifyOtpController._();

  late TextEditingController verification ;

  String code = "" ;
  String phone = "" ;

  @override
  void initState() {

    verification = TextEditingController();
    super.initState();
  }



  @override
  void dispose() {
    verification.dispose();
    super.dispose();
  }

  Future onSendPhoneOTP({required BuildContext context}) async {
    setState(() {});
    final result = await VerifyOtpDataHandler.sendPhoneOTP(code: code , phoneNumber: phone);
    result.fold((l) {
      ToastHelper.showError(message: l.errorModel.statusMessage);
    }, (r) async{
      if(context.mounted){
        Navigator.pushNamed(context,SplashScreen.routeName);
      }
    });
  }


}