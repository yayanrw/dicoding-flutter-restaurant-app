import 'package:flutter/material.dart';
import '../config/apps_config.dart';
import 'my_colors.dart';

InputDecorationTheme myInputDecorationTheme() {
  return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: TextStyle(color: MyColors.primaryDark),
      contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppsConfig.defaultRadius),
          borderSide: BorderSide(color: MyColors.primaryDark),
          gapPadding: 10),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppsConfig.defaultRadius),
          borderSide: BorderSide(color: MyColors.primaryDark),
          gapPadding: 10));
}
