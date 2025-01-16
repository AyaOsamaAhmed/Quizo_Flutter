import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:quizo_flutter/Modules/auth/login/login_screen.dart';
import 'package:quizo_flutter/Modules/auth/verifyOTP/verify_otp_screen.dart';

import '../../../generated/strings.dart';
import '../../../utilities/toast_helper.dart';
import 'create_account_data_handler.dart';


class CreateAccountController extends ControllerMVC {


  factory CreateAccountController(){
    _this ??= CreateAccountController._();
    return _this!;
  }

  static CreateAccountController?  _this;
  CreateAccountController._();

  late TextEditingController firstName , lastName ,  email , phone , password , confirmPassword;
  @override
  void initState() {

    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();

    super.initState();
  }



  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

   CheckValidationCreateAccount(){
    var check = false ;
      if(password.text.isEmpty){
        ToastHelper.showError(message: Strings.must_enter_first_name);
      }else if (lastName.text.isEmpty){
        ToastHelper.showError(message: Strings.must_enter_last_name);
      }else{
        check = true ;
      }
    return check ;
  }

  Future onCreateAccount({required BuildContext context}) async {
    setState(() {});
    final result = await CreateAccountDataHandler.registration(firstName: firstName.text , lastName: lastName.text , email: email.text , phoneNumber: phone.text);
    result.fold((l) {
      ToastHelper.showError(message: l.errorModel.statusMessage);
    }, (r) async{
      if(context.mounted){
        ToastHelper.showError(message: "Success account ");
        Navigator.pushNamed(context,VerifyOtpScreen.routeName ,
            arguments: {'phone': '${phone.text}' , 'code' : '20' , 'page': 'registration'});
      }
    });
  }


}