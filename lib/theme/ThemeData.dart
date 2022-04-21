// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:void_01/theme/hex_color.dart';
import 'package:void_01/theme/text_theme.dart';

class Styles {
  static ThemeData themeData(
      bool isDarkTheme, BuildContext context, String color1) {
    print(color1);
    return ThemeData(
      useMaterial3: true,
      textTheme: Texttheme1(context),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      colorSchemeSeed: hexToColor(color1),

      // colorScheme:
      //     isDarkTheme ? TabelaColorDark[color1] : TabelaColorlight[color1]
    );
  }
}
