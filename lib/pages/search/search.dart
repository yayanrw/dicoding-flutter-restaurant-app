import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/size_config.dart';
import 'package:restaurant_app/pages/search/components/search_body.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: SearchBody());
  }
}
