import 'package:shared_preferences/shared_preferences.dart';

class AppState {
  static const String firstLaunchKey = "firstLaunch";

  static Future<bool> isFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(firstLaunchKey) ?? true;
  }

  static Future<void> setFirstLaunchComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(firstLaunchKey, false);
  }
}
