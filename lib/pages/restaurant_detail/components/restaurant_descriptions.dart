import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/helper/theme/color_theme.dart';
import 'package:restaurant_app/helper/theme/text_theme.dart';
import 'package:restaurant_app/model/restaurant.dart';

class RestaurantDescriptions extends StatefulWidget {
  const RestaurantDescriptions({Key? key, required this.restaurant})
      : super(key: key);

  final RestaurantRestaurants restaurant;

  @override
  _RestaurantDescriptionsState createState() => _RestaurantDescriptionsState();
}

class _RestaurantDescriptionsState extends State<RestaurantDescriptions> {
  bool isFavorite = false;
  bool isMore = false;
  int maxLine = 5;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: widget.restaurant.name! + "\n",
                    style: textTheme(ColorTheme.secondary, FontWeight.w900)
                        .headline5,
                  ),
                  TextSpan(
                      text: widget.restaurant.city,
                      style: textTheme(ColorTheme.secondaryLight2).bodyText2)
                ])),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                  print(widget.restaurant.menus);
                });
              },
              child: Container(
                padding: EdgeInsets.all(16),
                width: 64,
                decoration: BoxDecoration(
                  color: isFavorite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Icon(
                  LineIcons.heartAlt,
                  color: isFavorite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Text(widget.restaurant.description!,
              style: textTheme(ColorTheme.secondaryLight2).bodyText2,
              textAlign: TextAlign.justify,
              maxLines: maxLine,
              overflow: TextOverflow.ellipsis),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TextButton(
              onPressed: () {
                setState(() {
                  isMore = !isMore;
                  if (isMore) {
                    setState(() {
                      maxLine = 1000;
                    });
                  } else {
                    setState(() {
                      maxLine = 5;
                    });
                  }
                });
              },
              child: Text(
                isMore ? "See less" : "See more detail",
                style: textTheme(ColorTheme.primary, FontWeight.bold).bodyText2,
              )),
        )
      ],
    );
  }
}