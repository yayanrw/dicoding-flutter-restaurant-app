import 'package:flutter/material.dart';

class MyColors {
  static Color primary = HexColor("#FDBD10");
  static Color primaryDark = HexColor("#FC9D0A");
  static Color primaryLight = HexColor("#fed250");
  static Color primarySmooth = Color(0xFFFFECDF);

  static Color secondary = HexColor("#141414");
  static Color secondaryLight = Color(0xFFD8D8D8);
  static Color secondaryLight2 = Color(0xFF979797);
  static Color secondary2 = Color(0xFF343434);

  static Color purple = Color(0xFF4A3298);
  static Color white = const Color(0xffffffff);

  static Color textBlack = const Color(0xff222222);
  static Color textGrey = const Color(0xff94959b);
  static Color textWhiteGrey = const Color(0xfff1f1f5);
  static Color bgWhiteSmooth = const Color(0xfffbfbfb);
  static Color bgScaffoldBackground = const Color(0xfff1f1f5);

  static Color success = const Color(0xff00ff00);
  static Color error = const Color(0xffff0000);
  static Color warning = const Color(0xffffff00);
  static Color info = const Color(0xff0000ff);
  static Color light = const Color(0xffffffff);
  static Color dark = const Color(0xff000000);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
