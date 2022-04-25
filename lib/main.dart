// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:void_01/src/env/models/manga/homepage.dart';
import 'package:void_01/theme/dark_theme_provider.dart';
import 'package:void_01/theme/hex_color.dart';

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
  final DarkThemeProvider _themeChangeProvider = DarkThemeProvider();
  @override
  void initState() {
    getCurrentAppTheme();

    super.initState();
  }

  void getCurrentAppTheme() async {
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
    return ChangeNotifierProvider(
      create: (_) {
        return _themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, child) => MaterialApp(
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
          home: Homepage2(),
        ),
      ),
    );
  }
}

texttheme1() => TextTheme(
      caption: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
      subtitle1: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline6: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline5: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      headline4: GoogleFonts.montserrat(
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
      headline3: GoogleFonts.montserrat(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline2: GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline1: GoogleFonts.montserrat(
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    );
