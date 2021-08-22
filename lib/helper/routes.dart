import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/pages/intro/intro.dart';
import 'package:restaurant_app/pages/other/under_construction.dart';
import 'package:restaurant_app/pages/sign_in/sign_in.dart';

final Map<String, WidgetBuilder> routes = {
  '/intro': (context) => Intro(),
  '/sign_in': (context) => SignIn(),
  '/under_construction': (context) => UnderConstruction(),
  '/home': (context) => UnderConstruction(),
};
