import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';
import 'package:flutter/material.dart';

class ADrawerTheme {
  ADrawerTheme._();

  static const DrawerThemeData lightTheme = DrawerThemeData(
    backgroundColor: AColorTheme.background,
    elevation: 70,
    surfaceTintColor: AColorTheme.darkBackground,

  );

  static const DrawerThemeData darkTheme = DrawerThemeData(
    backgroundColor: AColorTheme.darkBackground,
    elevation: 70,
    surfaceTintColor: AColorTheme.darkCard
  );
}
