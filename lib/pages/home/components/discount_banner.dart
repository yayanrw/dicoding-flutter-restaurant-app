import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/theme/color_theme.dart';
import 'package:restaurant_app/helper/theme/text_theme.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/under_construction');
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: ColorTheme.purple),
          child: Text.rich(TextSpan(
              text: 'A Summer Surprise\n',
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                    text: 'Cashback 20%',
                    style: textTheme(Colors.white, FontWeight.w700).headline4)
              ])),
        ),
      ),
    );
  }
}
