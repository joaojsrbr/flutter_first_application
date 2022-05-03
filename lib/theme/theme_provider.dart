import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:void_01/theme/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;
  Map<String, ThemeMode> themeModes = {
    'light': ThemeMode.light,
    'dark': ThemeMode.dark,
  };

  static ThemeController get to => Get.find();

  loadThemeMode() async {
    var box = await Hive.openBox('preferencias');
    String themeText = box.get('theme') ?? 'dark';
    isDark.value = themeText == 'dark' ? true : false;
    setMode(themeText);
  }

  Future setMode(String themeText) async {
    ThemeMode? themeMode = themeModes[themeText];
    Get.changeThemeMode(themeMode!);
    var box = await Hive.openBox('preferencias');
    await box.put('theme', themeText);
  }

  changeTheme() {
    setMode(isDark.value ? 'light' : 'dark');
    isDark.value = !isDark.value;
  }
}

class ColorThemeProvider with ChangeNotifier {
  ColorThemePreference colorThemePreference = ColorThemePreference();
  Config1TrueorFalsePreference config1TrueorFalsePreference =
      Config1TrueorFalsePreference();

  bool _config1 = false;
  bool _config2 = false;

  String _colorTheme = '#ff020106';

  bool get config1 => _config1;
  bool get config2 => _config2;

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

  set colorTheme(String value) {
    _colorTheme = value;
    colorThemePreference.setColorTheme(value);
    notifyListeners();
  }
}
