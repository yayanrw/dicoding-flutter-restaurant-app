import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/core/injection/injection.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';
import 'package:restaurant_app/generated/l10n.dart';
import 'package:rxdart/rxdart.dart';
import 'package:auto_route/auto_route.dart';

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

class NotificationHelper {
  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  NotificationHelper._internal() {
    _instance = this;
  }

  static NotificationHelper? _instance;

  Future<void> initNotifications(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  ) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          debugPrint('notification payload: $payload');
        }
        selectNotificationSubject.add(payload ?? 'empty payload');
      },
    );
  }

  Future<void> showNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    RestaurantModel restaurant,
  ) async {
    const String _channelId = '1';
    const String _channelName = 'channel_01';
    const String _channelDescription = 'restaurant app channel';

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: DefaultStyleInformation(true, true),
    );

    const IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails();
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    final String titleNotification = S.current.restaurantRecommendation;
    final String titleNews = restaurant.name;

    await flutterLocalNotificationsPlugin.show(
      0,
      titleNotification,
      titleNews,
      platformChannelSpecifics,
      payload: json.encode(restaurant.toJson()),
    );
  }

  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen(
      (String payload) async {
        final RestaurantModel restaurantModel = RestaurantModel.fromJson(
          json.decode(payload) as Map<String, dynamic>,
        );
        getIt<AppRouter>().push(RestaurantDetailRoute(id: restaurantModel.id));
      },
    );
  }
}
