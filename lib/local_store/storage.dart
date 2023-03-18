import 'package:shared_preferences/shared_preferences.dart';

class StorageFunc {
  static SharedPreferences? pref;
  static int counter = 0;
  static Future<void> saveCounter(int counterVal) async {
    pref!.setInt('counter', counterVal);
  }

  static Future<void> initializePreference() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<void> loadCounter() async {
    final pref = await SharedPreferences.getInstance();
    counter = (pref.getInt('counter') ?? 0);
  }
}
