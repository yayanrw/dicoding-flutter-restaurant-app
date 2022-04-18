import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/features/home/presentation/widgets/home/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _sub = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none)
        _showSnackbar(MyStrings.noInternet);
    });
  }

  _showSnackbar(String message) {
    var snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: MyColors.primaryDark),
      ),
      backgroundColor: MyColors.primarySmooth,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: HomeBody(),
    );
  }
}
