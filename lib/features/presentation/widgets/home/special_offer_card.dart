import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.name,
    required this.image,
    required this.press,
    required this.city,
    required this.rating,
  }) : super(key: key);

  final String name;
  final String city;
  final String image;
  final double rating;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: 260,
          height: 130,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.6,
                blurRadius: 7,
                offset: const Offset(1, 0), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(image, fit: BoxFit.cover),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '$name\n',
                          style: myTextTheme(
                            color: MyColors.light,
                            weight: FontWeight.w700,
                          ).headline6,
                        ),
                        TextSpan(
                          text: city,
                          style: myTextTheme(
                            color: MyColors.light,
                            weight: FontWeight.w700,
                          ).caption,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 10,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        LineIcons.starAlt,
                        size: 14,
                        color: Colors.white,
                      ),
                      Text(
                        rating.toString(),
                        style: myTextTheme(color: MyColors.light).subtitle2,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
