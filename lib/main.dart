import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/config/env.dart';
import 'package:restaurant_app/core/injection/injection.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'core/config/apps_config.dart';
import 'core/theme/theme.dart';

void main() {
  configureInjection(Env.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp.router(
        title: AppsConfig.appTitle,
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: myThemes(),
      ),
    );
  }
}
