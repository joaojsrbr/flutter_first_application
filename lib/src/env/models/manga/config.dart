import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../theme/dark_theme_provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigState();
}

class _ConfigState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

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
                  initialValue: themeChange.darkTheme == true,
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

  Widget buildBox({required Widget widget}) => Container(
        height: 130,
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: widget,
      );
}
