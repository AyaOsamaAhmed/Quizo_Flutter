import 'package:flutter/material.dart';

import '../../utilities/theme_helper.dart';
import '../../utilities/shared_preferences.dart';


class ThemeModel extends ThemeExtension<ThemeModel>{

  static ThemeModel get defaultTheme{
    return ThemeClass.darkTheme();
    // Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    // return brightness == Brightness.dark? ThemeClass.darkTheme():ThemeClass.lightTheme();
  }

  final bool isDark;
  final Color background;
  final Color primaryColor;
  final Color secondary;
  final Color mainBlack;
  final Color bodyColor;
  final Color labelColor;

  final Color success;
  final Color waiting;
  final Color cancel;
  final Color informative;


  ThemeModel({
    this.isDark = false,
    required this.background,
    required this.primaryColor,
    required this.secondary,
    required this.labelColor,
    required this.success,
    required this.waiting,
    required this.cancel,
    required this.informative,
    required this.mainBlack,
    required this.bodyColor,
});

  @override
  ThemeModel copyWith({
    bool? isDark,
    Color? reversedBlackWhite,
    Color? background,
    Color? primaryColor,
    Color? pTint1,
    Color? pTint2,
    Color? pShade1,
    Color? secondary,
    Color? regPrimary,
    Color? regSecondary,
    Color? regFieldBorder,
    Color? sTint1,
    Color? sTint2,
    Color? shade1,
    Color? cardLight,
    Color? labelColor,
    Color? success,
    Color? waiting,
    Color? cancel,
    Color? informative,
    Color? mainBlack,
    Color? bodyColor,
    Color? tabBarColor,
}) {
    return ThemeModel(
      isDark: isDark??this.isDark,
      background: background??this.background,
      primaryColor: primaryColor??this.primaryColor,
      secondary: secondary??this.secondary,
      labelColor: labelColor??this.labelColor,
      success: success??this.success,
      waiting: waiting??this.waiting,
      cancel: cancel??this.cancel,
      informative: informative??this.informative,
      mainBlack: mainBlack??this.mainBlack,
      bodyColor: bodyColor??this.bodyColor,
    );
  }

  factory ThemeModel.fromJson(Map<String, dynamic> json) => ThemeModel(
    isDark: json["isDark"],
    background: Color(json["background"]),
    primaryColor: Color(json["primaryColor"]),
    secondary: Color(json["secondary"]),
    labelColor: Color(json["labelColor"]),
    success: Color(json["success"]),
    waiting: Color(json["waiting"]),
    cancel: Color(json["cancel"]),
    informative: Color(json["informative"]),
    mainBlack: Color(json["mainBlack"]),
    bodyColor: Color(json["bodyColor"]),
  );

  Map<String, dynamic> toJson() => {
    "isDark": isDark,
    "background": background.value,
    "primaryColor": primaryColor.value,
    "secondary": secondary.value,
    "labelColor": labelColor.value,
    "success": success.value,
    "waiting": waiting.value,
    "cancel": cancel.value,
    "informative": informative.value,
    "mainBlack": mainBlack.value,
    "bodyColor": bodyColor.value,
  };


  @override
  ThemeModel lerp(ThemeExtension<ThemeModel>? other, double t) {
    if (other is! ThemeModel) {
      return this;
    }
    return SharedPref.getTheme()??defaultTheme;
  }
}