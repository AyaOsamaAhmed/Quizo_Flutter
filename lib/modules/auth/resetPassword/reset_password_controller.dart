import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:quizo_flutter/modules/auth/resetPassword/reset_password_handler.dart';
import '../../../utilities/toast_helper.dart';
import '../verifyOTP/verify_otp_screen.dart';


class ResetPasswordController extends ControllerMVC {


  factory ResetPasswordController(){
    _this ??= ResetPasswordController._();
    return _this!;
  }

  static ResetPasswordController?  _this;
  ResetPasswordController._();

  late TextEditingController email ;

  bool loading = false ;

  @override
  void initState() {
    super.initState();

    email = TextEditingController();
  }

  Future SendEmailOtp({required BuildContext context}) async {
    setState(() {
      loading = true;
    });
    final result = await ResetPasswordHandler.SendEmailOtp(email: email.text);
    result.fold((l) {
      ToastHelper.showError(message: l.errorModel.statusMessage);
      onReset();
    }, (r) async{
      if(context.mounted){
        print("${r.data}");
        Navigator.pushNamed(context,VerifyOtpScreen.routeName,
            arguments: {'email': email.text , 'page' :'reset_password'});
      }
    });
  }

  onReset() {
    loading = false;
  }



}