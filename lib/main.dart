import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:void_01/src/env/models/item/hive_config.dart';
import 'package:void_01/src/env/models/item/item.dart';
import 'package:void_01/src/env/models/item/repository.dart';
import 'package:void_01/src/env/models/manga/homepage/homepage.dart';
import 'package:void_01/theme/dark_theme_provider.dart';
import 'package:void_01/theme/hex_color.dart';
import 'package:void_01/theme/texttheme.dart';

late Box box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  Hive.registerAdapter(ItemAdapter());
  box = await Hive.openBox<Item>('item_favoritas');
  runApp(
    const _Myapphome(),
  );
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
          create: (context) => _themeChangeProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => Itemrepository(),
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
                hexStringToHexInt(value.colorTheme),
              ),
              brightness: value.darkTheme ? Brightness.dark : Brightness.light,
            ),
          ),
          home: const Homepage(),
        ),
      ),
    );
  }
}
