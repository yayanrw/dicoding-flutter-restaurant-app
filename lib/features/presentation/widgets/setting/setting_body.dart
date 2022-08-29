// ignore_for_file: always_specify_types
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/features/presentation/provider/schedulling_notifier.dart';
import 'package:restaurant_app/features/presentation/widgets/setting/custom_dialog.dart';
import 'package:restaurant_app/generated/l10n.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<SchedullingNotifier>(context, listen: false)
          .initIsScheduled(),
    );
  }

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
                return Switch(
                  activeColor: MyColors.primary,
                  value: data.isScheduled,
                  onChanged: (bool value) async {
                    if (Platform.isIOS) {
                      customDialog(context);
                    } else {
                      data.scheduledRestaurant(value: value);

                      if (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text(S.of(context).notificationIsActivated),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text(S.of(context).notificationIsDeactivated),
                          ),
                        );
                      }
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
