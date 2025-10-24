import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingleton {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

 

  static saveUSer(String key, String value) async {
    await _instance.setString(key, value);
  }

  static getUser(String key) {
    return _instance.get(key);
  }
}