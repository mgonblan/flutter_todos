import 'package:flutter/material.dart';

class FlutterTodosTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: Color(0xFFABE236),
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color(0xFFABE236),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: const Color(0xFFABE236),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: Color(0xFFABE236),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: const Color(0xFFABE236),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: const Color(0xFFABE236),
    );
  }
}
