import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/styles/app_text.dart';
import 'app_palette.dart';

class AppTheme {
  static ThemeData get light {//بكل مرة التطبيق بطلب ثيم  بتنفذ الكود هاد
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFFF9FAFB), // gray-50
      colorScheme: base.colorScheme.copyWith(
        primary: const Color(0xFF10B981), // emerald-500
        secondary: const Color(0xFF059669), // emerald-600
        error: const Color(0xFFDC2626), // red-600
      ),
      textTheme: AppTextStyles.textTheme(base.textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          elevation: 0,
        ),
      ),
      extensions: const <ThemeExtension<dynamic>>[AppPalette.light],
    );
  }
}