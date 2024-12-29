import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class LoginController extends ControllerMVC {


  factory LoginController(){
    _this ??= LoginController._();
    return _this!;
  }

  static LoginController?  _this;
  LoginController._();

  late TextEditingController userName , email , phone , password;
  @override
  void initState() {

    userName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.initState();
  }



  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

}