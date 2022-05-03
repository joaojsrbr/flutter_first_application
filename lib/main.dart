import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:void_01/src/env/models/item/hive_config.dart';
import 'package:void_01/src/env/models/item/adapters/item.dart';
import 'package:void_01/src/env/models/item/repository.dart';
import 'package:void_01/src/env/models/manga/favoritepage/favorite_pageController.dart';
import 'package:void_01/src/env/models/manga/homepage/homepage.dart';

import 'package:void_01/theme/theme_provider.dart';
import 'package:void_01/theme/hex_color.dart';
import 'package:void_01/theme/texttheme.dart';

const favoritesBox = 'item_favoritas';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  Hive.registerAdapter(ItemAdapter());
  await Hive.openBox<Item>(favoritesBox);
  Get.put(FavoritePageController());
  Get.put(ThemeController());
  runApp(
    ChangeNotifierProvider(
      create: (context) => Itemrepository(),
      child: const _Myapphome(),
    ),
  );
}

class _Myapphome extends StatefulWidget {
  const _Myapphome({Key? key}) : super(key: key);

  @override
  State<_Myapphome> createState() => __MyapphomeState();
}

class __MyapphomeState extends State<_Myapphome> {
  final ColorThemeProvider _themeChangeProvider = ColorThemeProvider();
  @override
  void initState() {
    _getCurrentAppTheme();
    super.initState();
  }

  void _getCurrentAppTheme() async {
    _themeChangeProvider.colorTheme =
        await _themeChangeProvider.colorThemePreference.getColor();
    _themeChangeProvider.config1 =
        await _themeChangeProvider.config1TrueorFalsePreference.getbool1();
    _themeChangeProvider.config2 =
        await _themeChangeProvider.config1TrueorFalsePreference.getbool2();
  }

  @override
  Widget build(BuildContext context) {
    ThemeController.to.loadThemeMode();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _themeChangeProvider,
        ),
      ],
      child: Consumer<ColorThemeProvider>(
        builder: (BuildContext context, value, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: texttheme1(),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(
                hexStringToHexInt(value.colorTheme),
              ),
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            textTheme: texttheme1(),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(
                hexStringToHexInt(value.colorTheme),
              ),
              brightness: Brightness.dark,
            ),
          ),
          home: Homepage(),
        ),
      ),
    );
  }
}
