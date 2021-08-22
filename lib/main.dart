import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/routes.dart';
import 'package:restaurant_app/helper/theme.dart';
import 'package:restaurant_app/pages/intro/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      // debugShowCheckedModeBanner: false,
      theme: theme(),
      // home: Intro(),
      initialRoute: '/intro',
      routes: routes,
    );
  }
}
