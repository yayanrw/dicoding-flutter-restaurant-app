import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/helper/color_theme.dart';

class SliderContent extends StatelessWidget {
  const SliderContent({Key? key, this.text, this.image}) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text!,
          style: TextStyle(color: ColorTheme.secondary),
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        SvgPicture.asset(
          image!,
          height: 200,
          width: 180,
        ),
      ],
    );
  }
}
