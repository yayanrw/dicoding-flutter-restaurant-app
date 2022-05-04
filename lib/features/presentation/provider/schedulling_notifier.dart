import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/background_service.dart';
import 'package:restaurant_app/core/utils/datetime_helper.dart';

@injectable
class SchedullingNotifier extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledRestaurant({bool? value}) async {
    _isScheduled = value!;
    if (_isScheduled) {
      debugPrint('Scheduling News Activated');
      notifyListeners();
      return AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      debugPrint('Scheduling News Canceled');
      notifyListeners();
      return AndroidAlarmManager.cancel(1);
    }
  }
}
