import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  final SharedPreferences prefs;

  SharedPrefHelper(this.prefs);

  String? getString(String key) => prefs.getString(key);

  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  bool? getBool(String key) => prefs.getBool(key);

  Future<void> setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  int? getInt(String key) => prefs.getInt(key);

  Future<void> setInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  double? getDouble(String key) => prefs.getDouble(key);

  Future<void> setDouble(String key, double value) async {
    await prefs.setDouble(key, value);
  }

  bool contains(String key) => prefs.containsKey(key);

  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  Future<void> clear() async {
    await prefs.clear();
  }
}
