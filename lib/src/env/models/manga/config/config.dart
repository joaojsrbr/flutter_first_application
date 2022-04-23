import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import '../../../../../theme/dark_theme_provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigState();
}

class _ConfigState extends State<ConfigPage> {
  Color currentColor = Colors.amber;
  PaletteType _paletteType = PaletteType.hsl;
  bool _displayThumbColor = true;
  final List<ColorLabelType> _labelTypes = [
    ColorLabelType.hsl,
    ColorLabelType.hsv
  ];
  bool _enableAlpha = true;
  bool _displayHexInputBar = false;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    // final configchange = Provider.of<ConfigProvider>(context);
    final List<ColorLabelType> _labelTypes = [
      ColorLabelType.hsl,
      ColorLabelType.hsv
    ];

    void onPrimaryColorChange(Color value) {
      themeChange.colorTheme = '#${value.value.toRadixString(16)}';
    }

    void changeColor(Color color) => setState(
          () {
            currentColor = color;
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
                'Color',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  title: const Text('Accent Color'),
                  leading: const Icon(
                    Icons.color_lens_outlined,
                  ),
                  onPressed: (_) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          titlePadding: const EdgeInsets.all(0),
                          contentPadding: const EdgeInsets.all(0),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: currentColor,
                              onColorChanged: changeColor,
                              colorPickerWidth: 300,
                              pickerAreaHeightPercent: 0.7,
                              labelTypes: _labelTypes,
                              enableAlpha: true,
                              displayThumbColor: true,
                              paletteType: _paletteType,
                              pickerAreaBorderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              hexInputBar: _displayHexInputBar,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                SettingsTile.switchTile(
                  activeSwitchColor: Theme.of(context).colorScheme.primary,
                  title: const Text('    Display HEX Label Text'),
                  leading: const Icon(
                    Icons.color_lens_outlined,
                  ),
                  initialValue: false,
                  onToggle: (bool value) => setState(
                    () => value == value,
                  ),
                ),
                SettingsTile.switchTile(
                  leading: const Icon(
                    Icons.color_lens_outlined,
                  ),
                  activeSwitchColor: Theme.of(context).colorScheme.primary,
                  title: const Text('    Display RGB Label Text'),
                  initialValue: _labelTypes.contains(ColorLabelType.rgb),
                  onToggle: (bool value) => setState(
                    () => value
                        ? _labelTypes.add(ColorLabelType.rgb)
                        : _labelTypes.remove(ColorLabelType.rgb),
                  ),
                ),
                SettingsTile.switchTile(
                  leading: const Icon(
                    Icons.color_lens_outlined,
                  ),
                  activeSwitchColor: Theme.of(context).colorScheme.primary,
                  title: const Text('    Display HSV Label Text'),
                  initialValue: _labelTypes.contains(ColorLabelType.hsv),
                  onToggle: (bool value) => setState(
                    () => value
                        ? _labelTypes.add(ColorLabelType.hsv)
                        : _labelTypes.remove(ColorLabelType.hsv),
                  ),
                ),
                SettingsTile.switchTile(
                  leading: const Icon(
                    Icons.color_lens_outlined,
                  ),
                  activeSwitchColor: Theme.of(context).colorScheme.primary,
                  title: const Text('    Display HSL Label Text'),
                  initialValue: _labelTypes.contains(ColorLabelType.hsl),
                  onToggle: (bool value) => setState(
                    () => value
                        ? _labelTypes.add(ColorLabelType.hsl)
                        : _labelTypes.remove(ColorLabelType.hsl),
                  ),
                ),
                SettingsTile.switchTile(
                  activeSwitchColor: Theme.of(context).colorScheme.primary,
                  key: const Key('DarkMode'),
                  initialValue: themeChange.darkTheme,
                  onToggle: (value) {
                    themeChange.darkTheme = value;
                  },
                  leading: Icon(themeChange.darkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode),
                  title: const Text('DarkMode'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    required this.content,
    required this.title,
    this.actions,
    Key? key,
  }) : super(key: key);

  final Widget title;
  final List<Widget>? actions;
  final Widget content;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Center(child: title),
        clipBehavior: Clip.antiAlias,
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: content,
        actions: actions,
      );
}
