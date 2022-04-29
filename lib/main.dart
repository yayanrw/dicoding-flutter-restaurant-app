import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/config/env.dart';
import 'package:restaurant_app/core/injection/injection.dart' as di;
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/theme/theme.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_detail_notifier.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_list_notifier.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_search_notifier.dart';

void main() {
  di.configureInjection(Env.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => di.getIt<RestaurantListNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.getIt<RestaurantDetailNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.getIt<RestaurantSearchNotifier>()),
      ],
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
