import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/core/utils/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const SearchRoute());
      },
      child: Container(
        width: SizeConfig.screenWidth! * 0.6,
        decoration: BoxDecoration(
            color: MyColors.secondaryLight2.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              Icon(LineIcons.search),
              SizedBox(width: 8),
              Text(
                MyStrings.searchRestaurants,
                style: TextStyle(color: MyColors.secondaryLight2),
              )
            ],
          ),
        ),
      ),
    );
  }
}