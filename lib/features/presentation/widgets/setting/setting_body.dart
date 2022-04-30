import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.setting),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: const <Widget>[
              Text(MyStrings.restaurantNotification),
              Text(MyStrings.enableNotification)
            ],
          ),
          Switch(
            value: true,
            onChanged: (bool value) {},
          ),
        ],
      ),
    );
  }
}
