import 'package:flutter/material.dart';
import 'color_theme.dart';

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(ColorTheme.primary),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0)),
          textStyle:
              MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 18)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)))));
}

TextButtonThemeData textButtonThemeData() {
  return TextButtonThemeData(
      style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(ColorTheme.primaryDark),
  ));
}
