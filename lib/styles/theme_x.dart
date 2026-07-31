import 'package:flutter/material.dart';
import 'app_palette.dart';

extension ThemeX on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  AppPalette get palette => Theme.of(this).extension<AppPalette>()!;
  TextTheme get texts => Theme.of(this).textTheme;
}
