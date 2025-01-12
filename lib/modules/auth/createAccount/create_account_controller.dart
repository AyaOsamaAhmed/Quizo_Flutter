import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/strings.dart';
import '../../../utilities/toast_helper.dart';


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
      if(firstName.text.isEmpty){
        ToastHelper.showError(message: Strings.must_enter_first_name);
      }else if (lastName.text.isEmpty){
        ToastHelper.showError(message: Strings.must_enter_last_name);
      }else{
        check = true ;
      }
    return check ;
  }
}