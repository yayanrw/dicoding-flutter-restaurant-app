import 'package:flutter/material.dart';
import 'color_theme.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorTheme.primary,
      accentColor: ColorTheme.primaryDark,
      primaryTextTheme: TextTheme(
        headline6: TextStyle(color: Colors.white),
      ),
      fontFamily: "Poppins",
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      textTheme: textTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: textSelectionThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData());
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(ColorTheme.primary),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0)),
          textStyle:
              MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 16)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)))));
}

TextSelectionThemeData textSelectionThemeData() {
  return TextSelectionThemeData(
    cursorColor: ColorTheme.primaryDark,
    selectionColor: ColorTheme.primaryDark,
    selectionHandleColor: ColorTheme.primaryDark,
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
        fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: TextStyle(
        fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: TextStyle(
        fontSize: 46, fontWeight: FontWeight.w700, color: ColorTheme.primary),
    headline4: TextStyle(
        fontSize: 33, fontWeight: FontWeight.w700, letterSpacing: 0.25),
    headline5: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
    headline6: TextStyle(
        fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: TextStyle(
        fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    elevation: 0,
    brightness: Brightness.light,
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
