// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";
  static const COLOR_STATUS = "COLORSTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  setColor(String value) async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setString(COLOR_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }

  Future<String> getColor() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    return prefs1.getString(COLOR_STATUS) ?? "";
  }
}
