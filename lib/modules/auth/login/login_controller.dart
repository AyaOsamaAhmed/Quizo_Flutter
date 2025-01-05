import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:quizo_flutter/modules/auth/login/login_data_handler.dart';

import '../../../utilities/toast_helper.dart';
import '../../Splash/splash_screen.dart';


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

  Future onLogIn({required BuildContext context}) async {
    setState(() {});
    final result = await LoginDataHandeler.login(phone: phone.text);
    result.fold((l) {
      ToastHelper.showError(message: l.errorModel.statusMessage);
    }, (r) async{
      if(context.mounted){
        Navigator.pushNamed(context,SplashScreen.routeName);
      }

    });

  }


}