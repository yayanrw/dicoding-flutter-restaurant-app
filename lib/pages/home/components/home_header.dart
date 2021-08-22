import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/pages/home/components/circular_button.dart';
import 'package:restaurant_app/pages/home/components/search_field.dart';

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
              Navigator.pushNamed(context, '/under_construction');
            },
          ),
          CircularButton(
            icon: LineIcons.user,
            isCountable: false,
            press: () {
              Navigator.pushNamed(context, '/under_construction');
            },
          )
        ],
      ),
    );
  }
}
