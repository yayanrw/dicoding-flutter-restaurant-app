import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/model/cls_restaurant.dart';
import 'package:restaurant_app/pages/home/home.dart';
import 'package:restaurant_app/pages/intro/intro.dart';
import 'package:restaurant_app/pages/other/under_construction.dart';
import 'package:restaurant_app/pages/restaurant_detail/restaurant_detail.dart';
import 'package:restaurant_app/pages/search/search.dart';
import 'package:restaurant_app/pages/sign_in/sign_in.dart';

final Map<String, WidgetBuilder> routes = {
  '/intro': (context) => Intro(),
  '/sign_in': (context) => SignIn(),
  '/under_construction': (context) => UnderConstruction(),
  '/home': (context) => Home(),
  '/search': (context) => Search(),
  '/restaurant_detail': (context) => RestaurantDetail(
      restaurantDetail:
          ModalRoute.of(context)?.settings.arguments as ClsRestaurantElement),
};
