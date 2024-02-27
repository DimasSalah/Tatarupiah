import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: light,
    colorSchemeSeed: dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: normal,
      selectionColor: normal,
      selectionHandleColor: normal,
    ),
    
  );
}