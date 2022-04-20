import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
    final value = 0;
    return SafeArea(
      child: AnimationConfiguration.synchronized(
        child: ScaleAnimation(
          duration: Duration(milliseconds: 300),
          child: SettingsList(
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
                  // SettingsTile.navigation(
                  //   leading: Icon(Icons.language),
                  //   title: Text('Language'),
                  //   value: Text('English'),
                  // ),
                  SettingsTile.switchTile(
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
                  SettingsTile.navigation(
                      title: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () => {themeChange.colorTheme = 0},
                            child: buildBox(widget: Text("asdas"))),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () => {themeChange.colorTheme = 1},
                            child: buildBox(widget: Text("asdas"))),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () => {print("asdas")},
                            child: buildBox(widget: Text("asdas"))),
                      ),
                    ],
                  )),
                ],
              ),
            ],
          ),
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
