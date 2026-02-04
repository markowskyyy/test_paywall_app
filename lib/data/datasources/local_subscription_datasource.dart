import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSubscriptionDataSource {
  static const String _key = 'subscription';

  Future<Map<String, dynamic>?> getSubscription() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = prefs.getString(_key);
      return json != null ? jsonDecode(json) as Map<String, dynamic> : null;
    } catch (_) {
      return null;
    }
  }

  Future<void> saveSubscription(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(data));
  }

  Future<void> clearSubscription() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}