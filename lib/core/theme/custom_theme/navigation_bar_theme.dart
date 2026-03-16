import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';
import 'package:flutter/material.dart';

class ANavigationBarTheme {
  ANavigationBarTheme._();

  static const NavigationBarThemeData lightTheme = NavigationBarThemeData(
    elevation: 70,
    backgroundColor: AColorTheme.background,
    surfaceTintColor: AColorTheme.background
  );

  static const NavigationBarThemeData darkTheme = NavigationBarThemeData(
    backgroundColor: AColorTheme.darkBackground,
    surfaceTintColor: AColorTheme.darkBackground,
    elevation: 70,
  );
}
