import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/app.dart';
import 'package:restaurant_app/helper/routes.dart';

import 'helper/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: App.appName,
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: '/intro',
      routes: routes,
    );
  }
}
