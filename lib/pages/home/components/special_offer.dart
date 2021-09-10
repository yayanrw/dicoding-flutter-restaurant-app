import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/cls_restaurant.dart';
import 'package:restaurant_app/pages/home/components/section_title.dart';
import 'package:restaurant_app/pages/home/components/special_offer_card.dart';

class SpecialOffer extends StatefulWidget {
  const SpecialOffer({
    Key? key,
  }) : super(key: key);

  @override
  _SpecialOfferState createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
  late Future<ClsRestaurant> _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().fetchAllRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Our recommendations',
          isMoreable: true,
          press: () {
            Navigator.pushNamed(context, '/under_construction');
          },
        ),
        SizedBox(height: 16),
        FutureBuilder(
            future: _restaurant,
            builder: (context, AsyncSnapshot<ClsRestaurant> snapshot) {
              try {
                var state = snapshot.connectionState;
                if (state != ConnectionState.done) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasData) {
                    return Container(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          var restaurant = snapshot.data?.restaurants[index];
                          return SpecialOfferCard(
                              name: restaurant!.name,
                              city: restaurant.city,
                              image: ApiService.imageDir + restaurant.pictureId,
                              rating: restaurant.rating,
                              press: () {
                                Navigator.pushNamed(
                                    context, '/restaurant_detail',
                                    arguments: restaurant);
                              });
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("No internet connections."));
                  } else {
                    return Text('');
                  }
                }
              } catch (e) {
                return Text('No internet connection');
              }
            })
      ],
    );
  }
}
