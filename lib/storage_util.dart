import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static late SharedPreferences preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData(Map<String, dynamic> data, String key) async {
    await preferences.setString(key, jsonEncode(data));
  }

  static Future<Map<String, dynamic>?> getData(String key) async {
    String? jsonString = preferences.getString(key);
    if (jsonString == null) {
      return null;
    }
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }
}
