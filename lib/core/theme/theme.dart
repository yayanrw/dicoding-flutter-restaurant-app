import 'package:flutter/material.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/theme/my_appbar_theme.dart';
import 'package:restaurant_app/core/theme/my_button.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_input_decoration_theme.dart';
import 'package:restaurant_app/core/theme/my_text_selection_theme_data.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';

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
