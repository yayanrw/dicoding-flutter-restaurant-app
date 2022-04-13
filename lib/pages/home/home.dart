import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import '../../core/utils/size_config.dart';
import 'components/home_body.dart';
import '../../theme/color_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _sub = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none)
        _showSnackbar("No internet connections");
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: HomeBody(),
    );
  }

  _showSnackbar(String message) {
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
