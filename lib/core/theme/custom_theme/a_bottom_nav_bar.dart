import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';
import 'package:flutter/material.dart';

class ABottomNavBar {
  ABottomNavBar._();

  static const BottomNavigationBarThemeData lightTheme =
      BottomNavigationBarThemeData(
        backgroundColor: AColorTheme.background,
        elevation: 30,

      );

  static const BottomNavigationBarThemeData darkTheme =
      BottomNavigationBarThemeData(
        backgroundColor: AColorTheme.darkBackground,
        elevation: 30,
      );
}
