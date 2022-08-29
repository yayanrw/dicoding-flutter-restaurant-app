import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/background_service.dart';
import 'package:restaurant_app/core/utils/datetime_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SchedullingNotifier extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<void> initIsScheduled() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isScheduled = prefs.getBool('isScheduled') ?? true;
    notifyListeners();
  }

  Future<bool> scheduledRestaurant({bool? value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isScheduled = value!;
    if (_isScheduled) {
      debugPrint('Scheduling News Activated');
      prefs.setBool('isScheduled', true);
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
      prefs.setBool('isScheduled', false);
      notifyListeners();
      return AndroidAlarmManager.cancel(1);
    }
  }
}
