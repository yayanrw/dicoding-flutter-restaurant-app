import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/features/presentation/provider/schedulling_notifier.dart';
import 'package:restaurant_app/features/presentation/widgets/setting/custom_dialog.dart';
import 'package:restaurant_app/generated/l10n.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).setting),
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
                  S.of(context).restaurantNotification,
                  style: myTextTheme(weight: FontWeight.bold).bodyText1,
                ),
                Text(
                  S.of(context).enableNotification,
                  style: myTextTheme(color: MyColors.textGrey).subtitle2,
                )
              ],
            ),
            Consumer<SchedullingNotifier>(
              builder: (
                BuildContext context,
                SchedullingNotifier data,
                Widget? child,
              ) {
                return Switch.adaptive(
                  activeColor: MyColors.primary,
                  value: data.isScheduled,
                  onChanged: (bool value) async {
                    if (Platform.isIOS) {
                      customDialog(context);
                    } else {
                      data.scheduledRestaurant(value: value);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
