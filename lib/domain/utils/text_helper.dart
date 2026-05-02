import 'package:easy_localization/easy_localization.dart';
import 'package:eeyadty/domain/utils/ui_constants.dart';
import 'package:flutter/material.dart';

import 'locale_helper.dart';

class Styles {
  static String englishFontFamily = 'Outfit';
  static String arabicFontFamily = 'Noto';

  static TextStyle customStyle(
      {Color? color,
      FontWeight? fontWeight,
      double? fontSize,
      bool isUnderLined = false}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 14,
        color: color ?? ColorConstants.darkBlue,
        decoration:
            isUnderLined ? TextDecoration.underline : TextDecoration.none,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle textNormal14MainColor(
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 14,
        color: color ?? ColorConstants.mainTextColor,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle title({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: color ?? ColorConstants.darkBlue,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle subTitle(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.bold,
        fontSize: fontSize ?? 18,
        color: color ?? ColorConstants.darkBlue,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle headline(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 16,
        color: color ?? ColorConstants.darkBlue,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle body(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 14,
        color: color ?? ColorConstants.mainTextColor,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle subBody(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 12,
        color: color ?? ColorConstants.mainTextColor,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle line(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 14,
        color: color ?? ColorConstants.darkBlue,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle listItem(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 14,
        color: color ?? ColorConstants.darkBlue,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle tag({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: 10,
        color: color ?? ColorConstants.darkBlue,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle button({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: color ?? Colors.white,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle label(
      {Color? color,
      FontWeight? fontWeight,
      double? fontSize,
      bool isUnderLined = false}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 16,
        color: color ?? ColorConstants.darkBlue,
        decoration:
            isUnderLined ? TextDecoration.underline : TextDecoration.none,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }

  static TextStyle hint({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: color ?? ColorConstants.primaryColor40,
        fontFamily:  getLocaleString() == 'ar' ? arabicFontFamily : englishFontFamily);
  }
}

class AppText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  const AppText(
    this.text, {
    super.key,
    this.textAlign = TextAlign.center,
    this.textStyle,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(),
      textAlign: textAlign,
      style: textStyle,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
