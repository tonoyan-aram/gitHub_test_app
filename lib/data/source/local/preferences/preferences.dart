import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();

  static Preferences instance = Preferences._();

  static SharedPreferences? _sharedPrefs;

  getSharedInstance() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }
}
