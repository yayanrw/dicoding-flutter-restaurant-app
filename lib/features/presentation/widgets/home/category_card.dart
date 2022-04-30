import 'package:flutter/material.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/utils/size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.press,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(64),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(AppsConfig.defaultPadding / 2),
                decoration: BoxDecoration(
                  color: MyColors.primarySmooth,
                  borderRadius:
                      BorderRadius.circular(AppsConfig.defaultRadius / 2),
                ),
                child: Icon(
                  icon,
                  color: MyColors.primaryDark,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
