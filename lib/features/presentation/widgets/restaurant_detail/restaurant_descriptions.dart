// ignore_for_file: use_build_context_synchronously, always_specify_types

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_detail_notifier.dart';
import 'package:restaurant_app/features/presentation/widgets/home/chip_text.dart';
import 'package:restaurant_app/generated/l10n.dart';

class RestaurantDescriptions extends StatefulWidget {
  const RestaurantDescriptions({Key? key, required this.restaurantDetail})
      : super(key: key);

  final RestaurantDetail restaurantDetail;

  @override
  _RestaurantDescriptionsState createState() => _RestaurantDescriptionsState();
}

class _RestaurantDescriptionsState extends State<RestaurantDescriptions> {
  bool _isMore = false;
  int _maxLine = 5;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<RestaurantDetailNotifier>(context, listen: false)
          .fetchFavoriteStatus(widget.restaurantDetail.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantDetailNotifier>(
      builder: (
        BuildContext context,
        RestaurantDetailNotifier data,
        Widget? child,
      ) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '${widget.restaurantDetail.name}\n',
                            style: myTextTheme(
                              color: MyColors.secondary,
                              weight: FontWeight.w900,
                            ).headline5,
                          ),
                          TextSpan(
                            text: widget.restaurantDetail.city,
                            style: myTextTheme(color: MyColors.secondaryLight2)
                                .bodyText2,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (data.isFavorite) {
                      await Provider.of<RestaurantDetailNotifier>(
                        context,
                        listen: false,
                      ).removeFromFavorite(widget.restaurantDetail.id);
                    } else {
                      await Provider.of<RestaurantDetailNotifier>(
                        context,
                        listen: false,
                      ).addToFavorite(
                        Restaurant.fromRestaurantDetail(
                          widget.restaurantDetail,
                        ),
                      );
                    }

                    final String message =
                        Provider.of<RestaurantDetailNotifier>(
                      context,
                      listen: false,
                    ).restaurantFavoriteMessage;

                    if (message == S.of(context).addedToFavorite ||
                        message == S.of(context).removedFromFavorite) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message)));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: 64,
                    decoration: BoxDecoration(
                      color: data.isFavorite
                          ? const Color(0xFFFFE6E6)
                          : const Color(0xFFF5F6F9),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                      LineIcons.heartAlt,
                      color: data.isFavorite
                          ? const Color(0xFFFF4848)
                          : const Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                widget.restaurantDetail.description,
                style: myTextTheme(color: MyColors.secondaryLight2).bodyText2,
                textAlign: TextAlign.justify,
                maxLines: _maxLine,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isMore = !_isMore;
                    if (_isMore) {
                      setState(() {
                        _maxLine = 1000;
                      });
                    } else {
                      setState(() {
                        _maxLine = 5;
                      });
                    }
                  });
                },
                child: Text(
                  _isMore ? S.of(context).seeLess : S.of(context).seeMoreDetail,
                  style: myTextTheme(
                    color: MyColors.primary,
                    weight: FontWeight.bold,
                  ).bodyText2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: SizedBox(
                height: 32,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.restaurantDetail.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChipText(
                      name: widget.restaurantDetail.categories[index].name,
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
