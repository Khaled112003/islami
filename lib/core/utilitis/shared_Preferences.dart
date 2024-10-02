import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData(
      String key, List<Map<String, dynamic>> value) async {
    final String jsonString = jsonEncode(value);
    await _preferences?.setString(key, jsonString);

    await _preferences?.setInt(
        '${key}_timestamp', DateTime.now().millisecondsSinceEpoch);
  }

  static List<Map<String, dynamic>>? getData(String key) {
    final String? jsonString = _preferences?.getString(key);
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList.map((e) => Map<String, dynamic>.from(e)).toList();
    }
    return null;
  }

  static int? getLastUpdatedTimestamp(String key) {
    return _preferences?.getInt('${key}_timestamp');
  }

  static Future<void> clear() async {
    await _preferences?.clear();
  }
}
