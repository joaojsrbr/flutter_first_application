import 'package:flutter/material.dart';
import 'package:void_01/theme/text_theme.dart';

import 'lib_color_schemes.g.dart';

class Styles {
  static ThemeData themeData(
      bool isDarkTheme, BuildContext context, int color1) {
    return ThemeData(
        useMaterial3: true,
        textTheme: Texttheme1(),
        colorScheme:
            isDarkTheme ? TabelaColorDark[color1] : TabelaColorlight[color1]);
  }
}
