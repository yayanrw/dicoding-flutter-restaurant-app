// ignore_for_file: always_specify_types

import 'package:equatable/equatable.dart';

class SliderData extends Equatable {
  const SliderData({required this.image, required this.text});

  final String image;
  final String text;

  @override
  List<Object?> get props => [image, text];
}

final List<SliderData> sliderData = [
  const SliderData(
    image: 'assets/images/breakfast.svg',
    text: "Welcome to Restaurant App, Let's shop!",
  ),
  const SliderData(
    image: 'assets/images/hamburger.svg',
    text: 'Do you want a hamburger?',
  ),
  const SliderData(
    image: 'assets/images/ice_cream.svg',
    text: 'Or, do you want an ice cream?',
  ),
  const SliderData(
    image: 'assets/images/eating_together.svg',
    text: "Let's shop and eating together!",
  ),
];
