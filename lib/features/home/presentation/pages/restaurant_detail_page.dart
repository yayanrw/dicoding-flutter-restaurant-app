import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/data/model/cls_restaurant.dart';
import 'package:restaurant_app/features/home/presentation/widgets/restaurant_detail/restaurant_detail_body.dart';

class RestaurantDetailPage extends StatelessWidget {
  final ClsRestaurantElement restaurantDetail;
  const RestaurantDetailPage({Key? key, required this.restaurantDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: RestaurantDetailBody(id: restaurantDetail.id));
  }
}
