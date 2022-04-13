import 'package:flutter/material.dart';

import 'core/config/apps_config.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppsConfig.appTitle,
      debugShowCheckedModeBanner: false,
      theme: myThemes(),
      initialRoute: '/intro',
    );
  }
}
