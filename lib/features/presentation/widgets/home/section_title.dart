import 'package:flutter/material.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/generated/l10n.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style:
                myTextTheme(color: MyColors.secondary, weight: FontWeight.w700)
                    .headline6,
          ),
          Visibility(
            visible: isMoreable,
            child: GestureDetector(
              onTap: press,
              child: Text(
                S.of(context).seeMore,
                style: myTextTheme(color: MyColors.secondaryLight2).caption,
              ),
            ),
          )
        ],
      ),
    );
  }
}
