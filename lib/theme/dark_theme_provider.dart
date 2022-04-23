import 'package:flutter/material.dart';
import 'package:void_01/theme/shared_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  ColorThemePreference colorThemePreference = ColorThemePreference();
  Config1TrueorFalsePreference config1TrueorFalsePreference =
      Config1TrueorFalsePreference();

  bool _config1 = false;
  bool _config2 = false;
  bool _darkTheme = false;
  String _colorTheme = '#ff020106';

  bool get config1 => _config1;
  bool get config2 => _config2;
  bool get darkTheme => _darkTheme;
  String get colorTheme => _colorTheme;

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

class ConfigProvider with ChangeNotifier {
  Config1TrueorFalsePreference config1TrueorFalsePreference =
      Config1TrueorFalsePreference();

  bool _config1 = false;
  bool _config2 = false;

  bool get config1 => _config1;
  bool get config2 => _config2;

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
}
