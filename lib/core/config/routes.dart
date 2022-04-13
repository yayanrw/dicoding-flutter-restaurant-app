import 'package:flutter/cupertino.dart';

import '../../data/model/cls_restaurant.dart';
import '../../pages/home/home.dart';
import '../../pages/intro/intro.dart';
import '../../pages/other/under_construction.dart';
import '../../pages/restaurant_detail/restaurant_detail.dart';
import '../../pages/search/search.dart';
import '../../pages/sign_in/sign_in.dart';

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
