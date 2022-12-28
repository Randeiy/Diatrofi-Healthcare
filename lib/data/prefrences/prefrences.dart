import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const dailyBreakfast = 'Daily_Breakfast';

  Future<bool> get isDailyRestaurantActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyBreakfast) ?? false;
  }

  void setDailyResep(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyBreakfast, value);
  }
}