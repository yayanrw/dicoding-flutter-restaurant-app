import 'package:flutter/material.dart';

import '../../helper/size_config.dart';
import 'components/intro_body.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: IntroBody());
  }
}
