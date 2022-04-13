import 'package:flutter/material.dart';
import '../../../helper/size_config.dart';
import '../../../theme/color_theme.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.press,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final VoidCallback press;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(64),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: ColorTheme.primarySmooth,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  icon,
                  color: ColorTheme.primaryDark,
                ),
              ),
            ),
            SizedBox(height: 5),
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
