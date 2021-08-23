import 'package:flutter/material.dart';

class ColorTheme {
  static Color primary = HexColor("#FDBD10");
  static Color primaryDark = HexColor("#FC9D0A");
  static Color primaryLight = HexColor("#fed250");
  static Color primarySmooth = Color(0xFFFFECDF);

  static Color secondary = HexColor("#141414");
  static Color secondaryLight = Color(0xFFD8D8D8);
  static Color secondaryLight2 = Color(0xFF979797);
  static Color secondary2 = Color(0xFF343434);

  static Color purple = Color(0xFF4A3298);
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
