// ignore_for_file: constant_identifier_names

import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

class ColorThemePreference {
  static const COLOR_STATUS = "COLORSTATUS";

  setColorTheme(String value) async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setString(COLOR_STATUS, value);
  }

  Future<String> getColor() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    return prefs1.getString(COLOR_STATUS) ?? '#ff020106';
  }
}

class Config1TrueorFalsePreference {
  static const CONFIG1_STATUS = "CONFIG1_STATUS";
  static const CONFIG2_STATUS = "CONFIG2_STATUS";
  setbool2(bool value) async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setBool(CONFIG2_STATUS, value);
  }

  Future<bool> getbool2() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    return prefs1.getBool(CONFIG2_STATUS) ?? false;
  }

  setbool1(bool value) async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setBool(CONFIG1_STATUS, value);
  }

  Future<bool> getbool1() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    return prefs1.getBool(CONFIG1_STATUS) ?? false;
  }
}
