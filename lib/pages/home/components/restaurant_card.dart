import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../core/utils/size_config.dart';
import '../../../theme/color_theme.dart';
import '../../../theme/text_theme.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.name,
    required this.city,
    required this.image,
    required this.rating,
    required this.press,
  }) : super(key: key);
  final String name, city, image;
  final double rating;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: SizeConfig.screenWidth! * 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 130,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              ColorTheme.secondary2.withOpacity(0.4),
                              ColorTheme.secondary2.withOpacity(0.15),
                            ])),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme(ColorTheme.secondary, FontWeight.w900)
                            .headline6),
                    Text(city,
                        style: textTheme(ColorTheme.secondaryLight2).caption),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          LineIcons.starAlt,
                          size: 16,
                          color: ColorTheme.primaryDark,
                        ),
                        Text(rating.toString(),
                            style:
                                textTheme(ColorTheme.secondary, FontWeight.bold)
                                    .caption)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
