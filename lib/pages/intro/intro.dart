import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/intro/components/intro_body.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: IntroBody());
  }
}
