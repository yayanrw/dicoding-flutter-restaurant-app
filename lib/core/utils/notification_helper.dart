import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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

    const String titleNotification = 'Our recommendation';
    final String titleRestaurant =
        '${restaurant.name} is open now! Go to the app!';

    tz.initializeTimeZones();

    final String largeIconPath = await _downloadAndSaveFile(
      '${AppsConfig.imageDirSmall}${restaurant.pictureId}',
      'largeIcon',
    );
    final String bigPicturePath = await _downloadAndSaveFile(
      '${AppsConfig.imageDirLarge}${restaurant.pictureId}',
      'bigPicture',
    );

    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      largeIcon: FilePathAndroidBitmap(largeIconPath),
      contentTitle: titleNotification,
      htmlFormatContentTitle: true,
      summaryText: titleRestaurant,
      htmlFormatSummaryText: true,
    );

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      styleInformation: bigPictureStyleInformation,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      titleNotification,
      titleRestaurant,
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      platformChannelSpecifics,
      payload: json.encode(restaurant.toJson()),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  void configureSelectNotificationSubject(BuildContext context) {
    selectNotificationSubject.stream.listen(
      (String payload) async {
        final RestaurantModel restaurantModel = RestaurantModel.fromJson(
          json.decode(payload) as Map<String, dynamic>,
        );
        context.router.push(RestaurantDetailRoute(id: restaurantModel.id));
      },
    );
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
