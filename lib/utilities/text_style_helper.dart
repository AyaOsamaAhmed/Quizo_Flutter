import '../core/Font/font_provider.dart';
import '/utilities/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class TextStyleHelper{
  final BuildContext context;
  TextStyleHelper._(this.context);

  static TextStyleHelper of(BuildContext context) => TextStyleHelper._(context);

  double get _fSS => Provider.of<FontProvider>(context,listen: false).fontSizeScale;

  _fontFamily(){
    return GoogleFonts.cairo;

  }

  TextStyle  getTextStyle({required double fontSize,FontWeight? fontWeight}) =>
      _fontFamily()(fontSize: (fontSize*_fSS).sp,fontWeight: fontWeight,color: ThemeClass.of(context).secondary);


  TextStyle get h1_20 => getTextStyle(fontSize: 20,fontWeight: FontWeight.w700);




  TextStyle get h_20 => getTextStyle(fontSize: 20,fontWeight: FontWeight.w600);
  TextStyle get h_18 => getTextStyle(fontSize: 18,fontWeight: FontWeight.w600);
  TextStyle get h_16 => getTextStyle(fontSize: 16,fontWeight: FontWeight.w600);


  TextStyle get b_16 => getTextStyle(fontSize: 16,fontWeight: FontWeight.w400);
  TextStyle get b_14 => getTextStyle(fontSize: 14,fontWeight: FontWeight.w400);
  TextStyle get b_12 => getTextStyle(fontSize: 12,fontWeight: FontWeight.w400);
  TextStyle get b_10 => getTextStyle(fontSize: 10,fontWeight: FontWeight.w400);
  TextStyle get b_64 => getTextStyle(fontSize: 64,fontWeight: FontWeight.w400);
  TextStyle get b_40 => getTextStyle(fontSize: 40,fontWeight: FontWeight.w400);

  TextStyle get b_12_500 => getTextStyle(fontSize: 12,fontWeight: FontWeight.w500);
}