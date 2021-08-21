import 'package:shared_preferences/shared_preferences.dart';

class Application {
  factory Application() {
    return _instance;
  }

  Application._internal();
  static final Application _instance = Application._internal();

  static bool debug = true;
  static String version = '1.0.0';
  static String domain = 'http://example.vn';
  static String name = 'Example';
  static late SharedPreferences preferences;

  Future<void> setPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }
}
