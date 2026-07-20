import 'package:get/get.dart';
import 'package:insighta/app_constants.dart';

/// خيار جدول التطعيم (سنوي، كل 6 أشهر...) مع عدد الأشهر لحساب التاريخ تلقائياً.
class ScheduleOption {
  final String label;
  final int months; // 0 = مخصّص/مرة واحدة → لا حساب تلقائي
  const ScheduleOption(this.label, this.months);
}

/// خيار فترة جرعة العلاج (كل 3 أيام...) مع عدد الأيام للحساب التلقائي.
class IntervalOption {
  final String label;
  final int days; // 0 = مخصّص → لا حساب تلقائي
  const IntervalOption(this.label, this.days);
}

///  مصدر واحد مشترك لكل القوائم القابلة للتوسّع (أسماء تطعيمات/علاجات/أمراض...).
/// أي اسم يُضاف من شاشة البروتوكولات يظهر تلقائياً في شاشة العلاج/الفحص، والعكس.
/// GetxService = يعيش طوال عمر التطبيق (permanent).
class CatalogService extends GetxService {
  final vaccineNames = <String>[...AppConstants.vaccineNamesDefault].obs;
  final treatmentNames = <String>[...AppConstants.treatmentNamesDefault].obs;
  final diseaseTypes = <String>[...AppConstants.diseaseTypesDefault].obs;
  final checkupTypes = <String>[...AppConstants.checkupTypesDefault].obs;

  // أسباب حركة الكمية في المخزن (قائمة قابلة للتوسّع)
  final medicineReasons = <String>[
    'تجديد الكمية',
    'سحب من الكمية',
    'طلبية جديدة',
    'رصيد افتتاحي',
    'تالف / منتهي',
    'تصحيح جرد',
  ].obs;

  final schedules = <ScheduleOption>[
    const ScheduleOption('سنوياً', 12),
    const ScheduleOption('كل 6 أشهر', 6),
    const ScheduleOption('كل شهرين', 2),
    const ScheduleOption('مرة واحدة', 0),
  ].obs;

  final intervals = <IntervalOption>[
    const IntervalOption('كل 3 أيام', 3),
    const IntervalOption('كل أسبوع', 7),
    const IntervalOption('كل أسبوعين', 14),
    const IntervalOption('كل شهر', 30),
    const IntervalOption('كل 3 أشهر', 90),
    const IntervalOption('كل 6 أشهر', 180),
    const IntervalOption('سنوياً', 365),
  ].obs;

  // إضافة اسم (بلا تكرار)
  void addVaccineName(String v) => _addUnique(vaccineNames, v);
  void addTreatmentName(String v) => _addUnique(treatmentNames, v);
  void addDiseaseType(String v) => _addUnique(diseaseTypes, v);
  void addCheckupType(String v) => _addUnique(checkupTypes, v);
  void addMedicineReason(String v) => _addUnique(medicineReasons, v);

  void addSchedule(String label) {
    if (!schedules.any((s) => s.label == label)) {
      schedules.add(ScheduleOption(label, 0)); // مخصّص → تاريخ يدوي
    }
  }

  void addInterval(String label) {
    if (!intervals.any((i) => i.label == label)) {
      intervals.add(IntervalOption(label, 0)); // مخصّص → تاريخ يدوي
    }
  }

  ScheduleOption? scheduleByLabel(String label) =>
      schedules.firstWhereOrNull((s) => s.label == label);
  IntervalOption? intervalByLabel(String label) =>
      intervals.firstWhereOrNull((i) => i.label == label);

  void _addUnique(RxList<String> list, String v) {
    final t = v.trim();
    if (t.isNotEmpty && !list.contains(t)) list.add(t);
  }
}