import 'package:flutter/material.dart';
import '../../../../core/utils/size_config.dart';
import '../widgets/intro_body.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: IntroBody());
  }
}
