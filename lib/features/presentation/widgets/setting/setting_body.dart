import 'package:flutter/material.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.setting),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppsConfig.defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  MyStrings.restaurantNotification,
                  style: myTextTheme(weight: FontWeight.bold).bodyText1,
                ),
                Text(
                  MyStrings.enableNotification,
                  style: myTextTheme(color: MyColors.textGrey).subtitle2,
                )
              ],
            ),
            Switch(
              value: true,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}
