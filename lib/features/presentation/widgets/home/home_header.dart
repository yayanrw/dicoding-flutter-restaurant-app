import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/features/presentation/widgets/home/circular_button.dart';
import 'package:restaurant_app/features/presentation/widgets/home/search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SearchField(),
          CircularButton(
            icon: LineIcons.heart,
            isCountable: true,
            press: () {
              context.router.push(const FavoriteRoute());
            },
          ),
          CircularButton(
            icon: LineIcons.cog,
            isCountable: false,
            press: () {
              context.router.push(const SettingRoute());
            },
          )
        ],
      ),
    );
  }
}
