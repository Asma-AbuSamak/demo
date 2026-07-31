import 'package:flutter/material.dart';

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  final Color primaryStrong;
  final Color pageBg;
  final Color cardBg;
  final Color accentLight;
  final Color accentGreen;
  final Color textMain;
  final Color textMuted;
  final Color border;
  final Color successBg;
  final Color successFg;
  final Color dangerBg;
  final Color dangerFg;
  final Color warningBg;
  final Color warningFg;
  final Color infoBg;
  final Color infoFg;
  final Color brandAccent;
  final LinearGradient headerGradient;

  const AppPalette({
    required this.primaryStrong,
    required this.pageBg,
    required this.cardBg,
    required this.accentLight,
    required this.accentGreen,
    required this.textMain,
    required this.textMuted,
    required this.border,
    required this.successBg,
    required this.successFg,
    required this.dangerBg,
    required this.dangerFg,
    required this.warningBg,
    required this.warningFg,
    required this.infoBg,
    required this.infoFg,
    required this.brandAccent,
    required this.headerGradient,
  });

  static const AppPalette light = AppPalette(
    primaryStrong: Color(0xFF059669),
    pageBg: Color(0xFFF9FAFB),
    cardBg: Color(0xFFFFFFFF),
    accentLight: Color(0xFFECFDF5),
    accentGreen: Color(0xFFDCFCE7),
    textMain: Color(0xFF111827),
    textMuted: Color(0xFF6B7280),
    border: Color(0xFFE5E7EB),
    successBg: Color(0xFFD1FAE5),
    successFg: Color(0xFF047857),
    dangerBg: Color(0xFFFEE2E2),
    dangerFg: Color(0xFFB91C1C),
    warningBg: Color(0xFFFEF9C3),
    warningFg: Color(0xFFA16207),
    infoBg: Color(0xFFDBEAFE),
    infoFg: Color(0xFF1D4ED8),
    brandAccent: Color(0xFFD97706),
    headerGradient: LinearGradient(
      colors: [Color(0xFF10B981), Color(0xFF0D9488)],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    ),
  );

  @override
  AppPalette copyWith({
    Color? primaryStrong,
    Color? pageBg,
    Color? cardBg,
    Color? accentLight,
    Color? accentGreen,
    Color? textMain,
    Color? textMuted,
    Color? border,
    Color? successBg,
    Color? successFg,
    Color? dangerBg,
    Color? dangerFg,
    Color? warningBg,
    Color? warningFg,
    Color? infoBg,
    Color? infoFg,
    Color? brandAccent,
    LinearGradient? headerGradient,
  }) {
    return AppPalette(
      primaryStrong: primaryStrong ?? this.primaryStrong,
      pageBg: pageBg ?? this.pageBg,
      cardBg: cardBg ?? this.cardBg,
      accentLight: accentLight ?? this.accentLight,
      accentGreen: accentGreen ?? this.accentGreen,
      textMain: textMain ?? this.textMain,
      textMuted: textMuted ?? this.textMuted,
      border: border ?? this.border,
      successBg: successBg ?? this.successBg,
      successFg: successFg ?? this.successFg,
      dangerBg: dangerBg ?? this.dangerBg,
      dangerFg: dangerFg ?? this.dangerFg,
      warningBg: warningBg ?? this.warningBg,
      warningFg: warningFg ?? this.warningFg,
      infoBg: infoBg ?? this.infoBg,
      infoFg: infoFg ?? this.infoFg,
      brandAccent: brandAccent ?? this.brandAccent,
      headerGradient: headerGradient ?? this.headerGradient,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      primaryStrong: Color.lerp(primaryStrong, other.primaryStrong, t)!,
      pageBg: Color.lerp(pageBg, other.pageBg, t)!,
      cardBg: Color.lerp(cardBg, other.cardBg, t)!,
      accentLight: Color.lerp(accentLight, other.accentLight, t)!,
      accentGreen: Color.lerp(accentGreen, other.accentGreen, t)!,
      textMain: Color.lerp(textMain, other.textMain, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
      successBg: Color.lerp(successBg, other.successBg, t)!,
      successFg: Color.lerp(successFg, other.successFg, t)!,
      dangerBg: Color.lerp(dangerBg, other.dangerBg, t)!,
      dangerFg: Color.lerp(dangerFg, other.dangerFg, t)!,
      warningBg: Color.lerp(warningBg, other.warningBg, t)!,
      warningFg: Color.lerp(warningFg, other.warningFg, t)!,
      infoBg: Color.lerp(infoBg, other.infoBg, t)!,
      infoFg: Color.lerp(infoFg, other.infoFg, t)!,
      brandAccent: Color.lerp(brandAccent, other.brandAccent, t)!,
      headerGradient:
          LinearGradient.lerp(headerGradient, other.headerGradient, t)!,
    );
  }
}
