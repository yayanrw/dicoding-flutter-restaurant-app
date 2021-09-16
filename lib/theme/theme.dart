import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'button_theme.dart';
import 'color_theme.dart';
import 'text_theme.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorTheme.primary,
      primaryTextTheme: TextTheme(
        headline6: TextStyle(color: Colors.white),
      ),
      fontFamily: "Poppins",
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      textTheme: textTheme(ColorTheme.secondary),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: textSelectionThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      textButtonTheme: textButtonThemeData());
}

TextSelectionThemeData textSelectionThemeData() {
  return TextSelectionThemeData(
    cursorColor: ColorTheme.primaryDark,
    selectionColor: ColorTheme.primaryDark,
    selectionHandleColor: ColorTheme.primaryDark,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: ColorTheme.primary,
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
