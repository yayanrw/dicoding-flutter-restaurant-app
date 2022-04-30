import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/features/presentation/widgets/search/search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(body: SearchBody());
  }
}
