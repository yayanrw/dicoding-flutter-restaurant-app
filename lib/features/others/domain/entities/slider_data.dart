import 'package:equatable/equatable.dart';

class SliderData extends Equatable {
  SliderData({required this.image, required this.text});

  final String image, text;

  @override
  List<Object?> get props => [image, text];
}

final List<SliderData> sliderData = [
  SliderData(
      image: 'assets/images/breakfast.svg',
      text: 'Welcome to Restaurant App, Let\'s shop!'),
  SliderData(
      image: 'assets/images/hamburger.svg', text: 'Do you want a hamburger?'),
  SliderData(
      image: 'assets/images/ice_cream.svg',
      text: 'Or, do you want an ice cream?'),
  SliderData(
      image: 'assets/images/eating_together.svg',
      text: 'Let\'s shop and eating together!'),
];
