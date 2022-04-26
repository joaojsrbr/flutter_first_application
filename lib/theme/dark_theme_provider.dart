import 'package:flutter/material.dart';
import 'package:void_01/theme/shared_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  ColorThemePreference colorThemePreference = ColorThemePreference();
  Config1TrueorFalsePreference config1TrueorFalsePreference =
      Config1TrueorFalsePreference();
  StringPreference stringPreference = StringPreference();

  bool _config1 = false;
  bool _config2 = false;
  bool _darkTheme = false;
  String _colorTheme = '#ff020106';
  List _list2 = [];

  List get list2 => _list2;
  bool get config1 => _config1;
  bool get config2 => _config2;
  bool get darkTheme => _darkTheme;
  String get colorTheme => _colorTheme;

  set list2(value) {
    _list2 = value;
    stringPreference.setstring(value);
    notifyListeners();
  }

  set config1(bool value) {
    _config1 = value;
    config1TrueorFalsePreference.setbool1(value);
    notifyListeners();
  }

  set config2(bool value) {
    _config2 = value;
    config1TrueorFalsePreference.setbool2(value);
    notifyListeners();
  }

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  set colorTheme(String value) {
    _colorTheme = value;
    colorThemePreference.setColorTheme(value);
    notifyListeners();
  }
}
