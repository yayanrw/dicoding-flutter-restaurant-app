import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'my_colors.dart';

AppBarTheme myAppBarTheme() {
  return AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: MyColors.light),
    backgroundColor: MyColors.primary,
  );
}
