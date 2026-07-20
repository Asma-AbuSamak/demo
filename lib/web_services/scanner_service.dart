import 'dart:math';

/// كود وهمي للسكانر (Demo):
/// يحاكي مسح شريحة RFID عبر البلوتوث — تأخير قصير ثم يرجّع معرّفاً.
/// لا يفتح أي ملفات ولا يحتاج أي صلاحيات.
///
/// TODO(V2): استبدلي جسم [scan] بمكتبة بلوتوث حقيقية (مثل flutter_blue_plus)
/// لقراءة شريحة RFID فعلية — دون تغيير أي شيء في الكونترولرز.
class ScannerService {
  final Random _rng = Random();

  /// [existing]=true مع [existingIds] ← يرجّع معرّفاً موجوداً (لعمليات على
  /// حيوان مسجّل). وإلا يرجّع معرّفاً جديداً RF-xxx.
  Future<String> scan({
    List<String> existingIds = const [],
    bool existing = false,
  }) async {
    // تأخير يحاكي نبضة الاتصال بالجهاز (بلا فتح ملفات)
    await Future.delayed(const Duration(milliseconds: 1200));

    if (existing && existingIds.isNotEmpty) {
      return existingIds[_rng.nextInt(existingIds.length)];
    }
    final n = _rng.nextInt(900) + 100;
    return 'RF-$n';
  }
}