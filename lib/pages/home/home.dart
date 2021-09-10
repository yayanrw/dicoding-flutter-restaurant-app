import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/size_config.dart';
import 'package:restaurant_app/pages/home/components/home_body.dart';
import 'package:restaurant_app/theme/color_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late StreamSubscription sub;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    sub = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        isConnected = (result != ConnectivityResult.none);

        isConnected
            ? showSnackbar("Connected")
            : showSnackbar("No internet connections");
      });
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: HomeBody(),
    );
  }

  showSnackbar(String message) {
    var snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: ColorTheme.primaryDark),
      ),
      backgroundColor: ColorTheme.primarySmooth,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
