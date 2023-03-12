import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPreferences {
  static final provider = Provider((ref) => LoginPreferences.instance);

  static final LoginPreferences instance = LoginPreferences._();

  final String _keyToken = "KEY_TOKEN";

  LoginPreferences._();

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_keyToken);
  }

  Future<bool> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(_keyToken, token);
  }

  Future<bool> removeToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.remove(_keyToken);
  }
}
