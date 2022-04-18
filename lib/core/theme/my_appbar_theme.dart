import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';

AppBarTheme myAppBarTheme() {
  return AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: MyColors.light),
    backgroundColor: MyColors.primary,
  );
}
