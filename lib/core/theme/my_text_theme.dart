import 'package:flutter/material.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';

TextTheme myTextTheme({Color? color, FontWeight? weight}) {
  final Color newColor = color ?? MyColors.textBlack;
  final FontWeight newWeight = weight ?? FontWeight.w500;

  return TextTheme(
    headline1: TextStyle(
      fontSize: 93,
      fontWeight: newWeight,
      letterSpacing: -1.5,
      color: newColor,
    ),
    headline2: TextStyle(
      fontSize: 58,
      fontWeight: newWeight,
      letterSpacing: -0.5,
      color: newColor,
    ),
    headline3: TextStyle(fontSize: 46, fontWeight: newWeight, color: color),
    headline4: TextStyle(
      fontSize: 33,
      fontWeight: newWeight,
      letterSpacing: 0.25,
      color: newColor,
    ),
    headline5: TextStyle(fontSize: 23, fontWeight: newWeight, color: color),
    headline6: TextStyle(
      fontSize: 19,
      fontWeight: newWeight,
      letterSpacing: 0.15,
      color: newColor,
    ),
    subtitle1: TextStyle(
      fontSize: 15,
      fontWeight: newWeight,
      letterSpacing: 0.15,
      color: newColor,
    ),
    subtitle2: TextStyle(
      fontSize: 15,
      color: newColor,
      fontWeight: newWeight,
      letterSpacing: 0.15,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: newWeight,
      letterSpacing: 0.5,
      color: newColor,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: newWeight,
      letterSpacing: 0.25,
      color: newColor,
    ),
    button: TextStyle(
      fontSize: 14,
      fontWeight: newWeight,
      letterSpacing: 1.25,
      color: newColor,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: newWeight,
      letterSpacing: 0.4,
      color: newColor,
    ),
    overline: TextStyle(
      fontSize: 10,
      fontWeight: newWeight,
      letterSpacing: 1.5,
      color: newColor,
    ),
  );
}
