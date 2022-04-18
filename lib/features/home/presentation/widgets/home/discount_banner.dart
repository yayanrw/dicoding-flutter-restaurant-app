import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';

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
          context.router.push(const UnderConstructionRoute());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: MyColors.purple),
          child: Text.rich(TextSpan(
              text: MyStrings.summerSurprise,
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                    text: MyStrings.cashback20,
                    style: myTextTheme(
                            color: MyColors.light, weight: FontWeight.w700)
                        .headline4)
              ])),
        ),
      ),
    );
  }
}
