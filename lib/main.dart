import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:void_01/src/env/models/manga/homepage.dart';
import 'package:void_01/theme/dark_theme_provider.dart';
import 'package:void_01/theme/hex_color.dart';
import 'package:void_01/theme/texttheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _appInit();
}

_appInit() async {
  runApp(const _Myapphome());
}

class _Myapphome extends StatefulWidget {
  const _Myapphome({Key? key}) : super(key: key);

  @override
  State<_Myapphome> createState() => __MyapphomeState();
}

class __MyapphomeState extends State<_Myapphome> {
  final DarkThemeProvider _themeChangeProvider = DarkThemeProvider();
  @override
  void initState() {
    _getCurrentAppTheme();
    super.initState();
  }

  void _getCurrentAppTheme() async {
    _themeChangeProvider.darkTheme =
        await _themeChangeProvider.darkThemePreference.getTheme();
    _themeChangeProvider.colorTheme =
        await _themeChangeProvider.colorThemePreference.getColor();
    _themeChangeProvider.config1 =
        await _themeChangeProvider.config1TrueorFalsePreference.getbool1();
    _themeChangeProvider.config2 =
        await _themeChangeProvider.config1TrueorFalsePreference.getbool2();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return _themeChangeProvider;
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: texttheme1(),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(
                hexStringToHexInt(_themeChangeProvider.colorTheme),
              ),
              brightness: _themeChangeProvider.darkTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
          ),
          home: const Homepage2(),
        ),
      ),
    );
  }
}
