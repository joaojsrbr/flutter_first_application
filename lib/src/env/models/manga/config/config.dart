import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:void_01/theme/hex_color.dart';
import '../../../../../theme/dark_theme_provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigState();
}

class _ConfigState extends State<ConfigPage> {
  final PaletteType _paletteType = PaletteType.hsl;

  @override
  Widget build(BuildContext context) {
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    void onPrimaryColorChange(Color value) {
      _themeChange.colorTheme = '#${value.value.toRadixString(16)}';
    }

    void changeColor(Color color) => setState(
          () {
            onPrimaryColorChange(color);
          },
        );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SettingsList(
          darkTheme: SettingsThemeData(
            settingsListBackground: Theme.of(context).colorScheme.background,
            titleTextColor: Theme.of(context).colorScheme.primary,
            tileDescriptionTextColor: Theme.of(context).colorScheme.secondary,
            trailingTextColor: Theme.of(context).colorScheme.secondary,
          ),
          lightTheme: SettingsThemeData(
            settingsListBackground: Theme.of(context).colorScheme.background,
            titleTextColor: Theme.of(context).colorScheme.primary,
            tileDescriptionTextColor: Theme.of(context).colorScheme.secondary,
            trailingTextColor: Theme.of(context).colorScheme.secondary,
          ),
          physics: const BouncingScrollPhysics(),
          sections: [
            SettingsSection(
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              tiles: <SettingsTile>[
                SettingsTile.switchTile(
                  activeSwitchColor: Theme.of(context).colorScheme.primary,
                  key: const Key('DarkMode'),
                  initialValue: _themeChange.darkTheme,
                  onToggle: (value) {
                    _themeChange.darkTheme = value;
                  },
                  leading: Icon(_themeChange.darkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode),
                  title: const Text('DarkMode'),
                ),
                SettingsTile(
                  key: const Key('Color'),
                  title: const Text('Color'),
                  leading: const Icon(Icons.color_lens),
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
                                pickerColor: Color(
                                    hexStringToHexInt(_themeChange.colorTheme)),
                                onColorChanged: changeColor,
                                colorPickerWidth: 300,
                                pickerAreaHeightPercent: 0.7,
                                enableAlpha: true,
                                displayThumbColor: true,
                                paletteType: _paletteType,
                                pickerAreaBorderRadius: const BorderRadius.only(
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
                  activeSwitchColor: Theme.of(context).colorScheme.primary,
                  title: const Text('themeChange.config1'),
                  leading: const Icon(
                    Icons.color_lens_outlined,
                  ),
                  initialValue: _themeChange.config1,
                  onToggle: (value) {
                    _themeChange.config1 = value;
                  },
                ),
                SettingsTile.switchTile(
                  leading: const Icon(
                    Icons.color_lens_outlined,
                  ),
                  activeSwitchColor: Theme.of(context).colorScheme.primary,
                  title: const Text('themeChange.config2'),
                  initialValue: _themeChange.config2,
                  onToggle: (value) {
                    _themeChange.config2 = value;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
