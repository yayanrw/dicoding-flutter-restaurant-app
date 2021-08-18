import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/size_config.dart';
import 'color_theme.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Poppins",
      appBarTheme: appBarTheme(),
      accentColor: ColorTheme.primaryDark,
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorTheme.primaryDark,
        selectionColor: ColorTheme.primaryDark,
        selectionHandleColor: ColorTheme.primaryDark,
      ));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: TextStyle(color: ColorTheme.primaryDark),
      contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: ColorTheme.primaryDark),
          gapPadding: 10),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: ColorTheme.primaryDark),
          gapPadding: 10));
}

ButtonStyle flatButtonStyle = TextButton.styleFrom(
  backgroundColor: ColorTheme.primary,
  primary: Colors.white,
  textStyle: TextStyle(fontSize: getProportionateScreenWidth(18)),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 12.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);
