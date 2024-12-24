import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/Theme/theme_model.dart';
import '../core/Theme/theme_provider.dart';

class ThemeClass extends ThemeModel{

  static ThemeModel of(BuildContext context) => Provider.of<ThemeProvider>(context,listen: false).appTheme;


  static const LinearGradient backgroundGradiant = LinearGradient(
    colors: [
      Color(0xff000000),
      Color(0xff240700),
      Color(0xff000000),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  );

  ThemeClass.lightTheme({
    super.isDark = false,
    super.background = const Color(0xff141414),
    super.primaryColor = const Color(0xffEE3B13),
    super.secondary = const Color(0xffE2E2E2),
    super.success = const Color(0xff00B060),
    super.waiting = const Color(0xffF68524),
    super.cancel = const Color(0xffEA3829),
    super.informative = const Color(0xff3892F3),
    super.mainBlack = const Color(0xff2E2E2E),
    super.bodyColor = const Color(0xffC2C2C2),
    super.labelColor = const Color(0xffA2A2A2),
  });

  ThemeClass.darkTheme({
    super.isDark = true,
    super.background = const Color(0xff141414),
    super.primaryColor = const Color(0xffEE3B13),
    super.secondary = const Color(0xffE2E2E2),
    super.success = const Color(0xff00B060),
    super.waiting = const Color(0xffF68524),
    super.cancel = const Color(0xffEA3829),
    super.informative = const Color(0xff3892F3),
    super.mainBlack = const Color(0xff2E2E2E),
    super.bodyColor = const Color(0xffC2C2C2),
    super.labelColor = const Color(0xffA2A2A2),
  });
}