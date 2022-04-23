// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:void_01/src/env/models/manga/homepage.dart';
import 'package:void_01/theme/dark_theme_provider.dart';
import 'package:void_01/theme/hex_color.dart';
import 'package:void_01/theme/text_theme.dart';

void main() async {
  appInit();
}

appInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(_Myapphome());
}

class _Myapphome extends StatefulWidget {
  const _Myapphome({Key? key}) : super(key: key);

  @override
  State<_Myapphome> createState() => __MyapphomeState();
}

class __MyapphomeState extends State<_Myapphome> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  ConfigProvider configProvider = ConfigProvider();
  @override
  void initState() {
    getCurrentAppTheme();
    getCurrentconfig();
    super.initState();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
    themeChangeProvider.colorTheme =
        await themeChangeProvider.colorThemePreference.getColor();
  }

  void getCurrentconfig() async {
    configProvider.config1 =
        await configProvider.config1TrueorFalsePreference.getbool1();
    configProvider.config2 =
        await configProvider.config1TrueorFalsePreference.getbool2();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true,
              textTheme: Texttheme1(context),
              brightness: themeChangeProvider.darkTheme
                  ? Brightness.dark
                  : Brightness.light,
              colorSchemeSeed: hexToColor(themeChangeProvider.colorTheme)),
          home: Homepage2(),
        ),
      ),
    );
  }
}
