import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/text_style_helper.dart';
import '../utilities/theme_helper.dart';

enum ButtonTypes {primary,secondary,outline,}

class CustomButtonWidget extends StatelessWidget {
  final Widget? child;
  final String? title;
  final double? width,height;
  final ButtonTypes buttonTypes;
  final Function()? onTap;

  final double? radius;
  final Color? backgroundColor;

  double get _radius => 12.r;

  const CustomButtonWidget.primary({super.key,this.radius, this.width,this.height,this.title,this.onTap,this.child}): buttonTypes = ButtonTypes.primary,backgroundColor = null;
  const CustomButtonWidget.secondary({super.key,this.radius, this.width,this.height,this.title,this.onTap,this.child}): buttonTypes = ButtonTypes.secondary,backgroundColor = null;
  const CustomButtonWidget.outline({super.key,this.radius, this.width,this.height,this.title,this.onTap,this.child}): buttonTypes = ButtonTypes.outline,backgroundColor = null;
  const CustomButtonWidget.custom({super.key,this.radius, this.width,this.height,this.title,this.onTap,this.child,required this.buttonTypes}): backgroundColor = null;
  const CustomButtonWidget.customPrimary({
    super.key,
    required this.backgroundColor,
    this.radius,
    this.width,
    this.height,
    this.onTap,
    required Widget this.child,
  }): buttonTypes = ButtonTypes.primary, title = null;

  BoxDecoration getDecoration(BuildContext context){
    final primaryDecoration = BoxDecoration(color: backgroundColor??ThemeClass.of(context).primaryColor, borderRadius: BorderRadius.circular(radius??_radius),);
    final secondaryDecoration = BoxDecoration(color: backgroundColor??ThemeClass.of(context).secondary, borderRadius: BorderRadius.circular(radius??_radius),);
    final outlinedDecoration = BoxDecoration(color: backgroundColor??Colors.transparent, borderRadius: BorderRadius.circular(radius??_radius), border: Border.all(color: ThemeClass.of(context).labelColor,width: 1.2.r));


    switch(buttonTypes){
      case ButtonTypes.primary: return primaryDecoration;
      case ButtonTypes.secondary: return secondaryDecoration;
      case ButtonTypes.outline: return outlinedDecoration;
    }
  }

  Color getTitleColor(BuildContext context){
    switch(buttonTypes){
      case ButtonTypes.primary: return Colors.white;
      case ButtonTypes.secondary: return ThemeClass.of(context).mainBlack;
      case ButtonTypes.outline: return ThemeClass.of(context).mainBlack;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height:height ?? 48.h,
        alignment: Alignment.center,
        decoration: getDecoration(context),
        child: child??Text(title??'',style: TextStyleHelper.of(context).b_16.copyWith(color: getTitleColor(context)),),
      ),
    );
  }
}