import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import 'package:void_01/theme/theme_provider.dart';

class ConfigPageController extends GetxController
    with GetTickerProviderStateMixin {
  ColorThemeProvider? themeChange;

  final PaletteType paletteType = PaletteType.hsl;
  ConfigPageController({required this.themeChange});
  late final AnimationController controller;

  @override
  void onInit() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 134));
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void onPrimaryColorChange(Color value) {
    themeChange!.colorTheme = '#${value.value.toRadixString(16)}';
  }

  void changeColor(Color color) {
    onPrimaryColorChange(color);
    update();
  }
}
