import 'package:flutter/material.dart';

import '../../data/model/cls_restaurant.dart';
import '../../core/utils/size_config.dart';
import 'components/restaurant_detail_body.dart';

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
