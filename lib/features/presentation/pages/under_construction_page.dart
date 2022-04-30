import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';

class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.underConstruction),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SvgPicture.asset(
                'assets/images/under_construction.svg',
                height: 400,
                width: 250,
              ),
            ),
            Text(
              MyStrings.underConstruction,
              style: myTextTheme().headline5,
            )
          ],
        ),
      ),
    );
  }
}
