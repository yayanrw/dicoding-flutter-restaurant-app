import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/helper/size_config.dart';
import 'package:restaurant_app/helper/theme/color_theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.6,
      decoration: BoxDecoration(
          color: ColorTheme.secondaryLight2.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16)),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search restaurant...",
            prefixIcon: Icon(LineIcons.search),
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
      ),
    );
  }
}
