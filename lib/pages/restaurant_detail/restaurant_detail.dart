import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/cls_restaurant.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/restaurant_detail_body.dart';
import 'package:restaurant_app/data/model/cls_restaurant_detail.dart';

class RestaurantDetail extends StatefulWidget {
  final ClsRestaurantElement restaurantDetail;

  const RestaurantDetail({
    Key? key,
    required this.restaurantDetail,
  }) : super(key: key);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  late Future<ClsRestaurantDetail> _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant =
        ApiService().fetchRestaurantDetail(widget.restaurantDetail.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _restaurant,
            builder: (context, AsyncSnapshot<ClsRestaurantDetail> snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasData) {
                  return RestaurantDetailBody(
                    restaurant: snapshot.data!.restaurant,
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Text('');
                }
              }
            }));
  }
}
