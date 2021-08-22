import 'package:flutter/material.dart';

TextTheme textTheme([Color? color]) {
  return TextTheme(
    headline1: TextStyle(
        fontSize: 93,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: color),
    headline2: TextStyle(
        fontSize: 58,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: color),
    headline3:
        TextStyle(fontSize: 46, fontWeight: FontWeight.w700, color: color),
    headline4: TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.25,
        color: color),
    headline5:
        TextStyle(fontSize: 23, fontWeight: FontWeight.w400, color: color),
    headline6: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: color),
    subtitle1: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: color),
    subtitle2: TextStyle(
        fontSize: 15,
        color: color,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: color),
    bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: color),
    button: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: color),
    caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: color),
    overline: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: color),
  );
}
