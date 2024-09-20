import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData(String key, List<Map<String, dynamic>> value) async {
    final String jsonString = jsonEncode(value);
    await _preferences?.setString(key, jsonString);

    // تخزين وقت التحديث الحالي
    await _preferences?.setInt('${key}_timestamp', DateTime.now().millisecondsSinceEpoch);
    print("تم حفظ البيانات بنجاح تحت المفتاح: $key");
  }

  static List<Map<String, dynamic>>? getData(String key) {
    final String? jsonString = _preferences?.getString(key);
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
      print("تم استرجاع البيانات من الكاش: $jsonString");
      return jsonList.map((e) => Map<String, dynamic>.from(e)).toList();
    }
    print("لم يتم العثور على بيانات مخزنة تحت المفتاح: $key");
    return null;
  }

  // استرجاع وقت آخر تحديث
  static int? getLastUpdatedTimestamp(String key) {
    return _preferences?.getInt('${key}_timestamp');
  }

  static Future<void> clear() async {
    await _preferences?.clear();
    print("تم مسح كل البيانات المخزنة في SharedPreferences.");
  }
}
