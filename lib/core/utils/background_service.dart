import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/core/config/api_service.dart';
import 'package:restaurant_app/core/utils/notification_helper.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';
import 'package:restaurant_app/main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  factory BackgroundService() => _instance ?? BackgroundService._internal();

  BackgroundService._internal() {
    _instance = this;
  }

  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    debugPrint('Alarm fired!');
    final NotificationHelper _notificationHelper = NotificationHelper();
    final RestaurantModel result = await ApiService().getRandomRestaurant();
    await _notificationHelper.showNotification(
      flutterLocalNotificationsPlugin,
      result,
    );

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
