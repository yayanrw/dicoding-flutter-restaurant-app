import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/pages/intro/intro.dart';
import 'package:restaurant_app/pages/login/login.dart';

final Map<String, WidgetBuilder> routes = {
  '/intro': (context) => Intro(),
  '/login': (context) => Login(),
};
