import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_detail_notifier.dart';
import 'package:restaurant_app/features/presentation/widgets/restaurant_detail/header.dart';
import 'package:restaurant_app/features/presentation/widgets/restaurant_detail/menus.dart';
import 'package:restaurant_app/features/presentation/widgets/restaurant_detail/restaurant_descriptions.dart';

class RestaurantDetailBody extends StatefulWidget {
  const RestaurantDetailBody({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<RestaurantDetailBody> createState() => _RestaurantDetailBodyState();
}

class _RestaurantDetailBodyState extends State<RestaurantDetailBody> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<RestaurantDetailNotifier>(context, listen: false)
            .fetchRestaurant(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantDetailNotifier>(builder: (context, data, child) {
      if (data.requestState == RequestState.loading) {
        return Center(child: CircularProgressIndicator());
      } else if (data.requestState == RequestState.loaded) {
        return SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Header(restaurantDetail: data.restaurant!),
            SizedBox(height: 8),
            RestaurantDescriptions(restaurantDetail: data.restaurant!),
            SizedBox(height: 24),
            Menus(restaurantDetail: data.restaurant!),
            SizedBox(height: 24),
          ],
        )));
      } else {
        return Center(
          key: Key('error_message'),
          child: Text(data.restaurantDetailMessage),
        );
      }
    });
  }
}
