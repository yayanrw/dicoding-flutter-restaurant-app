import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/cls_restaurant.dart';
import 'package:restaurant_app/helper/size_config.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/restaurant_detail_body.dart';

class RestaurantDetail extends StatelessWidget {
  final ClsRestaurantElement restaurantDetail;
  const RestaurantDetail({Key? key, required this.restaurantDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: RestaurantDetailBody(id: restaurantDetail.id));
  }
}
