import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/helper/size_config.dart';
import 'package:restaurant_app/theme/color_theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/search');
      },
      child: Container(
        width: SizeConfig.screenWidth! * 0.6,
        decoration: BoxDecoration(
            color: ColorTheme.secondaryLight2.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              Icon(LineIcons.search),
              SizedBox(width: 8),
              Text(
                "Search restaurant...",
                style: TextStyle(color: ColorTheme.secondaryLight2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
