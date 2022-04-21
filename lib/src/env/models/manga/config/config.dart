import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:void_01/src/env/models/manga/config/colorpick.dart';
import '../../../../../theme/dark_theme_provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigState();
}

class _ConfigState extends State<ConfigPage> {
  Future<void> colorPicker(List<Color> appColors, onColorChange) async {
    final status = await showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => MyAlertDialog(
            title: const Text(
              'Pick Color',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: SingleChildScrollView(
              child: ColorPicker(
                availableColors: appColors,
                pickerColor: Colors.deepOrangeAccent,
                onColorChanged: onColorChange,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Done'),
              ),
            ],
          ),
        ) ??
        false;
    if (status) {}
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    void onPrimaryColorChange(Color value) {
      themeChange.colorTheme = '#${value.value.toRadixString(16)}';
    }

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
                SettingsTile(
                  trailing: const Icon(
                    Icons.abc,
                  ),
                  title: const Text('Accent Color'),
                  leading: const Icon(
                    Icons.color_lens_outlined,
                  ),
                  onPressed: (_) {
                    colorPicker(primaryColors, onPrimaryColorChange);
                  },
                ),
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

List<Color> primaryColors = <Color>[
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.blue,
  Colors.indigo,
  Colors.cyan,
  Colors.teal,
  Colors.orange,
  Colors.deepOrange,
  Colors.amber,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];


//  Widget _buildBox({required Widget widget}) => Container(
//         height: 130,
//         decoration: const BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.all(
//             Radius.circular(8),
//           ),
//         ),
//         child: widget,
//       );