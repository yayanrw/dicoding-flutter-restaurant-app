import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/size_config.dart';
import 'package:restaurant_app/theme/color_theme.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    Key? key,
    required this.icon,
    required this.isCountable,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final bool isCountable;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(children: [
        Container(
            width: getProportionateScreenWidth(48),
            height: getProportionateScreenHeight(48),
            decoration: BoxDecoration(
                color: ColorTheme.secondaryLight2.withOpacity(0.1),
                shape: BoxShape.circle),
            child: Icon(icon)),
        Visibility(
          visible: isCountable,
          child: Positioned(
              right: 0,
              child: Container(
                height: getProportionateScreenHeight(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                    color: ColorTheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5)),
              )),
        )
      ]),
    );
  }
}
