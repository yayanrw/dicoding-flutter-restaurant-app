import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/size_config.dart';
import 'package:restaurant_app/pages/intro/components/intro_body.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: IntroBody());
  }
}
