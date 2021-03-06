import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:void_01/src/env/models/manga/configpage/configpage_controller.dart';
import 'package:void_01/theme/theme_provider.dart';
import 'package:void_01/theme/hex_color.dart';

class ConfigPage extends GetResponsiveWidget<ConfigPageController> {
  ConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _darkChange = ThemeController.to;
    final _themeChange = Provider.of<ColorThemeProvider>(context);
    Get.put(ConfigPageController(themeChange: _themeChange));

    return AnimationConfiguration.synchronized(
      child: ScaleAnimation(
        duration: const Duration(milliseconds: 100),
        child: FadeInAnimation(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SafeArea(
              child: GetBuilder<ConfigPageController>(
                builder: (controller) => SettingsList(
                  darkTheme: SettingsThemeData(
                    settingsListBackground:
                        Theme.of(context).colorScheme.background,
                    titleTextColor: Theme.of(context).colorScheme.primary,
                    tileDescriptionTextColor:
                        Theme.of(context).colorScheme.secondary,
                    trailingTextColor: Theme.of(context).colorScheme.secondary,
                  ),
                  lightTheme: SettingsThemeData(
                    settingsListBackground:
                        Theme.of(context).colorScheme.background,
                    titleTextColor: Theme.of(context).colorScheme.primary,
                    tileDescriptionTextColor:
                        Theme.of(context).colorScheme.secondary,
                    trailingTextColor: Theme.of(context).colorScheme.secondary,
                  ),
                  physics: const BouncingScrollPhysics(),
                  sections: [
                    SettingsSection(
                      title: const Center(
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      tiles: <SettingsTile>[
                        SettingsTile.switchTile(
                          activeSwitchColor:
                              Theme.of(context).colorScheme.primary,
                          key: const Key('DarkMode'),
                          initialValue: _darkChange.isDark.value,
                          onToggle: (value) {
                            // _themeChange.darkTheme = value;
                            if (_darkChange.isDark.value == false) {
                              _darkChange.changeTheme();
                              controller.controller.forward();
                            } else {
                              _darkChange.changeTheme();
                              controller.controller.reverse();
                            }
                          },
                          leading: Lottie.asset(
                            'assets/lottie/53164-light-dark-mode-button.json',
                            width: 70,
                            onLoaded: (c) {
                              controller.controller.duration = c.duration;
                              _darkChange.isDark.value
                                  ? controller.controller.forward()
                                  : controller.controller.reverse();
                            },
                            controller: controller.controller,
                          ),
                          title: const Text('DarkMode'),
                        ),
                        SettingsTile(
                          key: const Key('Color'),
                          title: const Text('Color'),
                          leading: const SizedBox(
                            width: 70,
                            child: Icon(
                              Icons.color_lens_outlined,
                              size: 29,
                            ),
                          ),
                          onPressed: (_) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  titlePadding: const EdgeInsets.all(0),
                                  contentPadding: const EdgeInsets.all(0),
                                  content: SingleChildScrollView(
                                    child: Material(
                                      child: ColorPicker(
                                        pickerColor: Color(hexStringToHexInt(
                                            _themeChange.colorTheme)),
                                        onColorChanged: controller.changeColor,
                                        colorPickerWidth: 300,
                                        pickerAreaHeightPercent: 0.7,
                                        enableAlpha: true,
                                        displayThumbColor: true,
                                        paletteType: controller.paletteType,
                                        pickerAreaBorderRadius:
                                            const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: const Text(
                        'config2',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      tiles: <SettingsTile>[
                        SettingsTile.switchTile(
                          activeSwitchColor:
                              Theme.of(context).colorScheme.primary,
                          title: const Text('themeChange.config1'),
                          leading: const Icon(
                            Icons.color_lens_outlined,
                          ),
                          initialValue: false,
                          onToggle: (value) {},
                        ),
                        SettingsTile.switchTile(
                          leading: const Icon(
                            Icons.color_lens_outlined,
                          ),
                          activeSwitchColor:
                              Theme.of(context).colorScheme.primary,
                          title: const Text('themeChange.config2'),
                          initialValue: false,
                          onToggle: (value) {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
