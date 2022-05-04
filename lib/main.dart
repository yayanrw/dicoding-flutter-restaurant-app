// ignore_for_file: always_specify_types

import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/config/env.dart';
import 'package:restaurant_app/core/injection/injection.dart' as di;
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/theme/my_themes.dart';
import 'package:restaurant_app/core/utils/background_service.dart';
import 'package:restaurant_app/core/utils/notification_helper.dart';
import 'package:restaurant_app/features/presentation/provider/favorite_restaurants_notifier.dart';
import 'package:restaurant_app/features/presentation/provider/random_restaurant_notifier.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_detail_notifier.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_list_notifier.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_search_notifier.dart';
import 'package:restaurant_app/generated/l10n.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  di.configureInjection(Env.dev);

  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.getIt<RestaurantListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.getIt<RestaurantDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.getIt<RestaurantSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.getIt<FavoriteRestaurantNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.getIt<RandomRestaurantNotifier>(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: AppsConfig.appTitle,
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: myThemes(),
      ),
    );
  }
}
