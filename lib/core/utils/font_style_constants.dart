import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woow_social/core/constants/color_constants.dart';

class FontStyles {
  static TextStyle fontExtraBold(
          {Color color = ColorConstants.grey900,
          double letterSpacing = 0.0,
          double fontSize = 14.0,
          TextDecoration decoration = TextDecoration.none}) =>
      GoogleFonts.urbanist(
          color: color,
          decoration: decoration,
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: (fontSize + 0.5).sp);

  static TextStyle fontBold(
          {Color color = ColorConstants.grey900,
          double letterSpacing = 0.0,
          double fontSize = 14.0,
          TextDecoration decoration = TextDecoration.none}) =>
      GoogleFonts.urbanist(
          color: color,
          decoration: decoration,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: (fontSize + 0.5));

  static TextStyle fontSemibold({
    Color color = ColorConstants.grey900,
    double letterSpacing = 0.0,
    double fontSize = 14.0,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      GoogleFonts.urbanist(
          color: color,
          decoration: decoration,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: (fontSize + 0.5));

  static TextStyle fontMedium(
          {Color color = ColorConstants.grey900,
          double letterSpacing = 0.0,
          double fontSize = 14.0,
          double height = 1,
          TextDecoration decoration = TextDecoration.none}) =>
      GoogleFonts.urbanist(
        color: color,
        decoration: decoration,
        fontWeight: FontWeight.w500,
        height: height,
        fontStyle: FontStyle.normal,
        letterSpacing: letterSpacing,
        fontSize: (fontSize + 0.5),
      );

  static TextStyle fontRegular(
          {Color color = ColorConstants.grey900,
          double letterSpacing = 0.0,
          double fontSize = 15.0,
          FontStyle fontStyle = FontStyle.normal,
          double height = 1.5,
          TextDecoration decoration = TextDecoration.none}) =>
      GoogleFonts.urbanist(
          color: color,
          height: height,
          decoration: decoration,
          fontWeight: FontWeight.w400,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          fontSize: (fontSize + 0.5));

  static TextStyle fontLight(
          {Color color = ColorConstants.grey900,
          double letterSpacing = 0.0,
          double fontSize = 14.0,
          double height = 1.0,
          FontStyle fontStyle = FontStyle.normal,
          TextDecoration decoration = TextDecoration.none}) =>
      GoogleFonts.urbanist(
          color: color,
          decoration: decoration,
          height: height,
          fontWeight: FontWeight.w300,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          fontSize: (fontSize + 0.5).sp);

  static TextStyle fontExtraLight(
          {Color color = ColorConstants.grey900,
          double letterSpacing = 0.0,
          double fontSize = 14.0,
          FontStyle fontStyle = FontStyle.normal,
          TextDecoration decoration = TextDecoration.none}) =>
      GoogleFonts.urbanist(
          color: color,
          fontWeight: FontWeight.w200,
          decoration: decoration,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          fontSize: (fontSize + 0.5).sp);
}
