import 'package:flutter/material.dart';
import 'package:void_01/theme/shared_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;
  int _colorTheme = 0;

  int get colorTheme => _colorTheme;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  set colorTheme(int value) {
    _colorTheme = value;
    darkThemePreference.setColor(value);
    notifyListeners();
  }
}
