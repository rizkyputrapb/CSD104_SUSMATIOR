import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  final Future<SharedPreferences> sharedPreferences;
  static const dailyReminderKey = 'DAILY_REMINDER_KEY';

  PreferenceHelper({required this.sharedPreferences});

  Future<bool> get isDailyReminderActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyReminderKey) ?? false;
  }

  void setDailyReminderActive(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyReminderKey, value);
  }
}
