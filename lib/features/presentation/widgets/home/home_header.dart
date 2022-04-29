import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/core/router/router.gr.dart';

import 'circular_button.dart';
import 'search_field.dart';

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
        children: [
          SearchField(),
          CircularButton(
            icon: LineIcons.bell,
            isCountable: true,
            press: () {
              context.router.push(const UnderConstructionRoute());
            },
          ),
          CircularButton(
            icon: LineIcons.user,
            isCountable: false,
            press: () {
              context.router.push(const UnderConstructionRoute());
            },
          )
        ],
      ),
    );
  }
}
