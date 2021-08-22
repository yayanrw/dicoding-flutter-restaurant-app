import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/helper/theme/color_theme.dart';
import 'package:restaurant_app/helper/theme/text_theme.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Under Construction"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SvgPicture.asset(
                'assets/images/under_construction.svg',
                height: 400,
                width: 250,
              ),
            ),
            Text(
              'Under Construction!',
              style: textTheme(ColorTheme.secondary).headline5,
            )
          ],
        ),
      ),
    );
  }
}
