import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';
import 'package:flutter/material.dart';

class AIconTheme {
  AIconTheme._();

  static const IconThemeData lightTheme = IconThemeData(
    color: AColorTheme.darkBackground,
  );

  static const IconThemeData darkTheme = IconThemeData(
    color: AColorTheme.background,
  );
}
