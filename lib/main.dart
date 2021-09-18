import 'package:flutter/material.dart';
import 'package:restaurant_app/config/app.dart';
import 'package:restaurant_app/config/routes.dart';
import 'package:restaurant_app/theme/theme.dart';

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
