import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/color_theme.dart';
import 'package:restaurant_app/theme/text_theme.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.text,
    required this.press,
    required this.isMoreable,
  }) : super(key: key);

  final String text;
  final bool isMoreable;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: textTheme(ColorTheme.secondary, FontWeight.w700).headline6,
          ),
          Visibility(
            visible: isMoreable,
            child: GestureDetector(
                onTap: press,
                child: Text(
                  'See more',
                  style: textTheme(ColorTheme.secondaryLight2).caption,
                )),
          )
        ],
      ),
    );
  }
}
