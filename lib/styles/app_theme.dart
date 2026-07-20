import 'package:flutter/material.dart';
import 'package:insighta/styles/app_text.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get light {//بكل مرة التطبيق بطلب ثيم  بتنفذ الكود هاد
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.pageBg,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.primaryDark,
        error: AppColors.destructive,
      ),
      textTheme: AppTextStyles.textTheme(base.textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
    );
  }
}