// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:void_01/src/env/models/manga/homepage.dart';
import 'package:void_01/theme/ThemeData.dart';
import 'package:void_01/theme/dark_theme_provider.dart';

void main() async {
  appInit();
}

appInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

late _MyAppState settingUI;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    getCurrentAppColor();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  void getCurrentAppColor() async {
    themeChangeProvider.colorTheme =
        await themeChangeProvider.darkThemePreference.getColor();
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
          theme: Styles.themeData(themeChangeProvider.darkTheme, context,
              themeChangeProvider.colorTheme),
          home: Homepage2(),
        ),
      ),
    );
  }
}
