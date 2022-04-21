import 'package:flutter/material.dart';
import 'package:void_01/theme/shared_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;
  String _colorTheme = "#ffe91e63";

  bool get darkTheme => _darkTheme;
  String get colorTheme => _colorTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  set colorTheme(String value) {
    _colorTheme = value;
    darkThemePreference.setColor(value);
    notifyListeners();
  }
}
