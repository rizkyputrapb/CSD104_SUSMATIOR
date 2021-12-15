import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:susmatior_app/preferences/preference_helper.dart';
import 'package:susmatior_app/util/background_service.dart';
import 'package:susmatior_app/util/date_time_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  final PreferenceHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getDailyReminderShow();
  }
  static const alarmId = 1;

  bool _isDailyReminderActive = false;
  bool get isDailyReminderActive => _isDailyReminderActive;

  void setDailyReminderActive(bool reminderActive) async {
    preferencesHelper.setDailyReminderActive(reminderActive);
    _isDailyReminderActive = reminderActive;
    notifyListeners();

    if (reminderActive) {
      await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        alarmId,
        BackgroundService.callback,
        startAt: DateTimeHelper.getReminderNotification(),
        exact: true,
        wakeup: true,
      );

      Fluttertoast.showToast(
        msg: 'Reminder\'s daily enabled!',
        backgroundColor: Colors.amber[900],
        textColor: Colors.white,
      );
    } else {
      await AndroidAlarmManager.cancel(alarmId);
      Fluttertoast.showToast(
        msg: 'Reminder\'s daily disabled!',
        backgroundColor: Colors.amber[900],
        textColor: Colors.white,
      );
    }
  }

  Future _getDailyReminderShow() async {
    _isDailyReminderActive = await preferencesHelper.isDailyReminderActive;
    notifyListeners();
  }
}
