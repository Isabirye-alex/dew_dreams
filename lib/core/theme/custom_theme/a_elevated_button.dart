import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';
import 'package:flutter/material.dart';

class AElevatedButton {
  AElevatedButton._();

  static ElevatedButtonThemeData lightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 20,
      foregroundColor: AColorTheme.background,
      backgroundColor: AColorTheme.primary
    )
  );
}
