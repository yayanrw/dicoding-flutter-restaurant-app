import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/my_colors.dart';
import '../../../../core/utils/size_config.dart';

class SliderContent extends StatelessWidget {
  const SliderContent({Key? key, this.text, this.image}) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text!,
          style: TextStyle(color: MyColors.secondary),
          textAlign: TextAlign.center,
        ),
        Spacer(
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
