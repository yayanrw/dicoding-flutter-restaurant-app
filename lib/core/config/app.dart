import 'package:line_icons/line_icons.dart';

class App {
  static String appName = 'Restaurant App';

  static List<Map<String, String>> sliderData = [
    {
      "image": "assets/images/breakfast.svg",
      "text": "Welcome to Restaurant App, Let's shop!",
    },
    {
      "image": "assets/images/hamburger.svg",
      "text": "Do you want a hamburger?",
    },
    {
      "image": "assets/images/ice_cream.svg",
      "text": "Or, do you want an ice cream?",
    },
    {
      "image": "assets/images/eating_together.svg",
      "text": "Let's shop and eating together!",
    },
  ];

  static List<Map<String, dynamic>> menuCategories = [
    {"icon": LineIcons.map, "text": "Near me"},
    {"icon": LineIcons.ribbon, "text": "Best seller"},
    {"icon": LineIcons.piggyBank, "text": "Budget meal"},
    {"icon": LineIcons.percent, "text": "Discount"},
    {"icon": LineIcons.heartbeat, "text": "Healthy food"},
  ];
}
