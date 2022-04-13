// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:void_01/src/env/models/manga/homepage.dart';
import 'package:void_01/src/env/models/manga/theme/brightnesstheme.dart';
import 'package:void_01/src/env/models/manga/theme/texttheme.dart';

void main() => runApp(_MyApp());

class _MyApp extends StatefulWidget {
  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    PreferenciaTema.setTema();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    PreferenciaTema.setTema();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: PreferenciaTema.tema,
      builder: (BuildContext context, Brightness tema, _) => MaterialApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: Texttheme1(),
          brightness: tema,
          useMaterial3: true,
          checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
        ),
        home: Homepage2(),
      ),
    );
  }
}
