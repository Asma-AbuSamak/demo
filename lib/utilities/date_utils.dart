import 'package:insighta/app_constants.dart';
import 'package:intl/intl.dart';

/// دوال التواريخ والأعمار — كل التواريخ مخزّنة كـ epoch UTC (milliseconds).
class AppDate {
  static DateTime get today => DateTime.now();

  static int nowEpoch() => DateTime.now().toUtc().millisecondsSinceEpoch;

  /// منتصف الليل UTC لليوم الحالي.
  static int todayEpoch() {
    final n = DateTime.now().toUtc();
    return DateTime.utc(n.year, n.month, n.day).millisecondsSinceEpoch;
  }

  /// يطبّع DateTime (من DatePicker مثلاً) لمنتصف الليل UTC كـ epoch.
  static int dateOnlyEpoch(DateTime d) =>
      DateTime.utc(d.year, d.month, d.day).millisecondsSinceEpoch;

  /// العمر بصيغة "X سنة Y شهر".
  static String calcAgeEpoch(int birthMs) {
    final b = DateTime.fromMillisecondsSinceEpoch(birthMs, isUtc: true);
    final n = DateTime.now().toUtc();
    final months = (n.year - b.year) * 12 + (n.month - b.month);
    if (months < 12) return '$months شهر';
    final y = months ~/ 12;
    final rem = months % 12;
    return rem > 0 ? '$y سنة $rem شهر' : '$y سنة';
  }

  static bool isExpiredEpoch(int ms) =>
      DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true)
          .isBefore(DateTime.now().toUtc());

  static bool isExpiringSoonEpoch(int ms) {
    final diff = DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true)
        .difference(DateTime.now().toUtc())
        .inDays;
    return diff >= 0 && diff <= 60;
  }

  /// تاريخ عربي مختصر.
  static String formatEpoch(int ms) => DateFormat('d MMM yyyy', 'ar')
      .format(DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true));

  /// من مفتاح "2025-07" إلى "يوليو 2025"
  static String formatMonth(String key) {
    final parts = key.split('-');
    final dt = DateTime(int.parse(parts[0]), int.parse(parts[1]));
    return DateFormat('MMMM yyyy', 'ar').format(dt);
  }

  static int monthsBetweenEpoch(int ms) {
    final d = DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true);
    final n = DateTime.now().toUtc();
    return (n.year - d.year) * 12 + (n.month - d.month);
  }

  static int addMonthsEpoch(int ms, int months) {
    final d = DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true);
    return DateTime.utc(d.year, d.month + months, d.day).millisecondsSinceEpoch;
  }

  static int addDaysEpoch(int ms, int days) =>
      ms + Duration(days: days).inMilliseconds;

  /// يحسب التاريخ القادم بناءً على الجدول (annual/6months/2months/once). null لو مجهول.
  static int? calcNextDateEpoch(int fromMs, String schedule) {
    final opt = AppConstants.scheduleOptions
        .firstWhere((o) => o['val'] == schedule, orElse: () => const {'months': 0});
    final months = opt['months'] as int;
    if (months == 0) return null;
    return addMonthsEpoch(fromMs, months);
  }

  static int yearOfEpoch(int ms) =>
      DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true).year;

  static int monthOfEpoch(int ms) =>
      DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true).month;
}
