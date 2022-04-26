import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/features/presentation/widgets/restaurant_detail/restaurant_detail_body.dart';

class RestaurantDetailPage extends StatelessWidget {
  final String id;
  const RestaurantDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: RestaurantDetailBody(id: id));
  }
}
