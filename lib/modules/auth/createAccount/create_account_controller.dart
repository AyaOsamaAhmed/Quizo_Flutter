import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


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

}