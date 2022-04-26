import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/features/presentation/widgets/home/chip_text.dart';

class RestaurantDescriptions extends StatefulWidget {
  const RestaurantDescriptions({Key? key, required this.restaurantDetail})
      : super(key: key);

  final RestaurantDetail restaurantDetail;

  @override
  _RestaurantDescriptionsState createState() => _RestaurantDescriptionsState();
}

class _RestaurantDescriptionsState extends State<RestaurantDescriptions> {
  bool _isFavorite = false;
  bool _isMore = false;
  int _maxLine = 5;
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
                    text: widget.restaurantDetail.name + "\n",
                    style: myTextTheme(
                            color: MyColors.secondary, weight: FontWeight.w900)
                        .headline5,
                  ),
                  TextSpan(
                      text: widget.restaurantDetail.city,
                      style: myTextTheme(color: MyColors.secondaryLight2)
                          .bodyText2)
                ])),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
              child: Container(
                padding: EdgeInsets.all(16),
                width: 64,
                decoration: BoxDecoration(
                  color: _isFavorite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Icon(
                  LineIcons.heartAlt,
                  color: _isFavorite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Text(widget.restaurantDetail.description,
              style: myTextTheme(color: MyColors.secondaryLight2).bodyText2,
              textAlign: TextAlign.justify,
              maxLines: _maxLine,
              overflow: TextOverflow.ellipsis),
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
                _isMore ? MyStrings.seeLess : MyStrings.seeMoreDetail,
                style: myTextTheme(
                        color: MyColors.primary, weight: FontWeight.bold)
                    .bodyText2,
              )),
        ),
        Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Container(
              height: 32,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.restaurantDetail.categories.length,
                  itemBuilder: (context, index) {
                    return ChipText(
                        name: widget.restaurantDetail.categories[index].name);
                  }),
            ))
      ],
    );
  }
}
