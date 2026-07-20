import 'package:flutter/material.dart';

class BaseStyles {
  static ThemeMode currentThemeMode = ThemeMode.light;

  static void toggleTheme(bool isDark) {
    currentThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  static ThemeData getTheme() {
    return currentThemeMode == ThemeMode.dark ? darkTheme : lightTheme;
  }

  static final ThemeData lightTheme = ThemeData(
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: const Color(0xFF101318),
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.primary,
      foregroundColor: _darkColorScheme.onPrimary,
    ),
  );

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0071CE),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE0EFFE),
    onPrimaryContainer: Color(0xFF0157A3),
    secondary: Color(0xFF64789B),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFECEFF3),
    onSecondaryContainer: Color(0xFF50607C),
    tertiary: Color(0xFF00BA73),
    onTertiary: Color(0xFFFFFFFF),
    error: Color(0xFFF54A45),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFFFFFFFF),
    onBackground: Color(0xFF14181F),
    surface: Color(0xFFF0F0F0),
    onSurface: Color(0xFF14181F),
    errorContainer: Color(0xFFFFE2E1),
    onErrorContainer: Color(0xFFBE1C17),
    surfaceVariant: Color(0xFFF3F4F7),
    onSurfaceVariant: Color(0xFF667999),
    inverseSurface: Color(0xFF29303D),
    inversePrimary: Color(0xFFB9DEFE),
    outline: Color(0xFFE7EAEF),
    outlineVariant: Color(0xFFF3F4F7),
    shadow: Color(0x1A8A96A3),
    surfaceTint: Color(0xFF0071CE),
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF0071CE),//Color(0xFFB9DEFE),
    onPrimary: Color(0xFF064B86),
    primaryContainer: Color(0xFF0157A3),
    onPrimaryContainer: Color(0xFFE0EFFE),
    secondary: Color(0xFFC1C9D7),
    onSecondary: Color(0xFF191d24),
    secondaryContainer: Color(0xFF50607C),
    onSecondaryContainer: Color(0xFFECEFF3),
    tertiary: Color(0xFF00BA73),
    onTertiary: Color(0xFFFFFFFF),
    error: Color(0xFFFFCAC8),
    onError: Color(0xFFBE1C17),
    background: Color(0xFF101318),
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFF212731),
    onSurface: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFF54A45),
    onErrorContainer: Color(0xFFFFE2E1),
    surfaceVariant: Color(0xFF3D485C),
    onSurfaceVariant: Color(0xFFC2C9D6),
    inverseSurface: Color(0xFFE0E4EB),
    inversePrimary: Color(0xFF0071CE),
    outline: Color(0xFF52617A),
    outlineVariant: Color(0xFF3D485C),
    shadow: Color(0x00000000),
    surfaceTint: Color(0xFFB9DEFE),
  );
}