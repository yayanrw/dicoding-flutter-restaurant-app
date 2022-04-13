import 'package:flutter/cupertino.dart';

import '../../data/model/cls_restaurant.dart';
import '../../pages/home/home.dart';
import '../../features/others/presentation/pages/intro_page.dart';
import '../../features/others/presentation/pages/under_construction_page.dart';
import '../../pages/restaurant_detail/restaurant_detail.dart';
import '../../pages/search/search.dart';
import '../../features/sign_in/presentation/pages/sign_in_page.dart';

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
