import 'package:flutter/material.dart';

/// لوحة ألوان التطبيق (مطابقة لتصميم React).
class AppColors {
  static const Color bg          = Color(0xFFFFFFFF);
  static const Color pageBg      = Color(0xFFF9FAFB); // gray-50
  static const Color primary     = Color(0xFF10B981); // emerald-500
  static const Color primaryDark = Color(0xFF059669); // emerald-600
  static const Color teal600     = Color(0xFF0D9488);
  static const Color accentLight = Color(0xFFECFDF5); // emerald-50
  static const Color accentGreen = Color(0xFFDCFCE7);
  static const Color textMain    = Color(0xFF111827); // gray-900
  static const Color textMuted   = Color(0xFF6B7280); // gray-500
  static const Color border      = Color(0xFFE5E7EB); // gray-200
  static const Color destructive = Color(0xFFDC2626); // red-600

  // شارات الحالة / السجلات
  static const Color emeraldBg  = Color(0xFFD1FAE5);
  static const Color emeraldFg  = Color(0xFF047857);
  static const Color redBg      = Color(0xFFFEE2E2);
  static const Color redFg      = Color(0xFFB91C1C);
  static const Color yellowBg   = Color(0xFFFEF9C3);
  static const Color yellowFg   = Color(0xFFA16207);
  static const Color blueBg     = Color(0xFFDBEAFE);
  static const Color blueFg     = Color(0xFF1D4ED8);
  static const Color amber      = Color(0xFFD97706);

  // تدرّجات (الهيدر وتسجيل الدخول فقط)
  static const LinearGradient headerGradient = LinearGradient(
    colors: [primary, teal600],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );
}