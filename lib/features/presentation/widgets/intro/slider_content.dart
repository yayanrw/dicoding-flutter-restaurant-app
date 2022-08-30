import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/utils/size_config.dart';

class SliderContent extends StatelessWidget {
  const SliderContent({Key? key, this.text, this.image}) : super(key: key);
  final String? text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Text(
            text!,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: MyColors.secondary),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        SvgPicture.asset(
          image!,
          height: getProportionateScreenHeight(200),
          width: getProportionateScreenWidth(180),
        ),
      ],
    );
  }
}
