import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/features/presentation/provider/favorite_restaurants_notifier.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.restaurantDetail,
  }) : super(key: key);

  final RestaurantDetail restaurantDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 1,
      height: 250,
      child: ClipRRect(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: 'restaurant_image_${restaurantDetail.pictureId}',
              child: Image.network(
                AppsConfig.imageDir + restaurantDetail.pictureId,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    MyColors.secondary2.withOpacity(0.4),
                    MyColors.secondary2.withOpacity(0.15),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: InkWell(
                onTap: () {
                  context.router.pop().then((bool value) {
                    Provider.of<FavoriteRestaurantNotifier>(
                      context,
                      listen: false,
                    ).fetchFavoriteRestaurants();
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 5),
                    Text(
                      restaurantDetail.rating.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      LineIcons.starAlt,
                      size: 18,
                      color: MyColors.primaryDark,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
