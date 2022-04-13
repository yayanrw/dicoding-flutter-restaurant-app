import 'package:flutter/material.dart';
import '../../core/utils/size_config.dart';
import 'components/search_body.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: SearchBody());
  }
}
