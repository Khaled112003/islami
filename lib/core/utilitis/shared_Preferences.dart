import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData(String key, List<Map<String, dynamic>> value) async {
    final String ayahJsonString = jsonEncode(value);
    await _preferences?.setString(key, ayahJsonString);
  }

  
  static List<Map<String, dynamic>>? getData(String key) {
    final String? ayahJsonString = _preferences?.getString(key);
    if (ayahJsonString != null) {
      List<dynamic> jsonList = jsonDecode(ayahJsonString) as List<dynamic>;
      return jsonList.map((e) => Map<String, dynamic>.from(e)).toList();
    }
    return null;
  }

  
  static Future<void> clear() async {
    await _preferences?.clear();
  }
}
