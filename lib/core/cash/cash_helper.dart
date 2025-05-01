import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/models/user_model.dart';

class CashHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> cacheUser(UserModel user) async {
    final userJson = jsonEncode(user.toJson());
    if (_prefs != null) {
      await _prefs!.setString('CACHED_USER', userJson);
    }  }

  static UserModel? getCachedUser() {
    if (_prefs != null) {
      final userJson = _prefs!.getString('CACHED_USER');
      if (userJson != null) {
        return UserModel.fromJson(jsonDecode(userJson));
      }
    }
    return null;
  }

  static Future<void> clearCachedUser() async {
    if (_prefs != null) {
      await _prefs!.remove('CACHED_USER');
    }
  }
}
