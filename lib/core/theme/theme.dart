import 'package:flutter/material.dart';
import '../config/apps_config.dart';
import 'my_appbar_theme.dart';
import 'my_button.dart';
import 'my_colors.dart';
import 'my_input_decoration_theme.dart';
import 'my_text_selection_theme_data.dart';
import 'my_text_theme.dart';

ThemeData myThemes() {
  return ThemeData(
      scaffoldBackgroundColor: MyColors.bgScaffoldBackground,
      primaryColor: MyColors.primary,
      fontFamily: AppsConfig.fontFamily,
      appBarTheme: myAppBarTheme(),
      inputDecorationTheme: myInputDecorationTheme(),
      textTheme: myTextTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: myTextSelectionThemeData(),
      elevatedButtonTheme: myElevatedButtonThemeData(),
      textButtonTheme: myTextButtonThemeData());
}
