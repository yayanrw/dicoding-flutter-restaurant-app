// ignore_for_file: always_specify_types

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/generated/l10n.dart';

class SliderData extends Equatable {
  const SliderData({required this.image, required this.text});

  final String image;
  final String text;

  @override
  List<Object?> get props => [image, text];
}

final List<SliderData> sliderData = [
  SliderData(
    image: 'assets/images/breakfast.svg',
    text: S.current.welcomeToRestaurantAppLetsShop,
  ),
  SliderData(
    image: 'assets/images/hamburger.svg',
    text: S.current.doYouWantAHamburger,
  ),
  SliderData(
    image: 'assets/images/ice_cream.svg',
    text: S.current.orDoYouWantAnIceCream,
  ),
  SliderData(
    image: 'assets/images/eating_together.svg',
    text: S.current.letsShopAndEatingTogether,
  ),
];
