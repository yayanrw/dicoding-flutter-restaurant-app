import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/features/presentation/widgets/intro/intro_body.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(body: IntroBody());
  }
}
