import 'package:insighta/app_constants.dart';
import 'package:intl/intl.dart';

/// دوال التواريخ والأعمار 
class AppDate {
  static DateTime get today => DateTime.now();

  /// العمر بصيغة "X سنة Y شهر".
  static String calcAge(String birthDate) {
    final b = DateTime.parse(birthDate);
    final n = today;
    final months = (n.year - b.year) * 12 + (n.month - b.month);
    if (months < 12) return '$months شهر';
    final y = months ~/ 12;
    final rem = months % 12;
    return rem > 0 ? '$y سنة $rem شهر' : '$y سنة';
  }

  static bool isExpired(String d) => DateTime.parse(d).isBefore(today);

  static bool isExpiringSoon(String d) {
    final diff = DateTime.parse(d).difference(today).inDays;
    return diff >= 0 && diff <= 60;
  }

  /// تاريخ عربي مختصر5
  static String formatDate(String d) =>
      DateFormat('d MMM yyyy', 'ar').format(DateTime.parse(d));

  /// من مفتاح "2025-07" إلى "يوليو 2025"
  static String formatMonth(String key) {
    final parts = key.split('-');
    final dt = DateTime(int.parse(parts[0]), int.parse(parts[1]));
    return DateFormat('MMMM yyyy', 'ar').format(dt);
  }

  /// يحسب التاريخ القادم بناءً على الجدول (annual/6months/2months/once).
  static String calcNextDate(String fromDate, String schedule) {
    final opt = AppConstants.scheduleOptions
        .firstWhere((o) => o['val'] == schedule, orElse: () => const {'months': 0});
    final months = opt['months'] as int;
    if (months == 0 || fromDate.isEmpty) return '';
    final d = DateTime.parse(fromDate);
    final next = DateTime(d.year, d.month + months, d.day);
    return DateFormat('yyyy-MM-dd').format(next);
  }

  static int monthsBetween(String dateStr) {
    final d = DateTime.parse(dateStr);
    final n = today;
    return (n.year - d.year) * 12 + (n.month - d.month);
  }

  static String todayIso() => DateFormat('yyyy-MM-dd').format(today);

  /// يضيف عدد أشهر لتاريخ ويرجّعه بصيغة yyyy-MM-dd.
  static String addMonthsIso(DateTime d, int months) =>
      DateFormat('yyyy-MM-dd').format(DateTime(d.year, d.month + months, d.day));

  /// يضيف عدد أيام لتاريخ ويرجّعه بصيغة yyyy-MM-dd.
  static String addDaysIso(DateTime d, int days) =>
      DateFormat('yyyy-MM-dd').format(d.add(Duration(days: days)));
}