import 'package:flutter/material.dart';

class ColorTheme {
  static Color primary = HexColor("#FDBD10");
  static Color primaryDark = HexColor("#FC9D0A");
  static Color primaryLight = HexColor("#fed250");

  static Color secondary = HexColor("#141414");
  static Color secondaryLight = HexColor("#8c8c8c");
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
