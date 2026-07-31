import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:insighta/database/app_database.dart';

class ScheduleOption {
  final String label;
  final int months;
  const ScheduleOption(this.label, this.months);
}

class IntervalOption {
  final String label;
  final int days;

  
  const IntervalOption(this.label, this.days);
}

class CatalogService extends GetxService {
  final AppDatabase _db = Get.find<AppDatabase>();
  final List<StreamSubscription> _subscriptions = [];

  final vaccineNames = <String>[].obs;
  final treatmentNames = <String>[].obs;
  final diseaseTypes = <String>[].obs;
  final checkupTypes = <String>[].obs;

  // أسباب حركة الكمية في المخزن (قائمة قابلة للتوسّع)
  final medicineReasons = <String>[].obs;

  final schedules = <ScheduleOption>[].obs;
  final intervals = <IntervalOption>[].obs;

  @override
  void onInit() {
    super.onInit();
    _bindPlain('vaccineName', vaccineNames);
    _bindPlain('treatmentName', treatmentNames);
    _bindPlain('diseaseType', diseaseTypes);
    _bindPlain('checkupType', checkupTypes);
    _bindPlain('medicineReason', medicineReasons);

    _subscriptions.add(_db.catalogDao.watchByCategory('schedule').listen((items) {
      schedules.value = [
        for (final i in items) ScheduleOption(i.label, _extraInt(i.extra, 'months')),
      ];
    }));
    _subscriptions.add(_db.catalogDao.watchByCategory('interval').listen((items) {
      intervals.value = [
        for (final i in items) IntervalOption(i.label, _extraInt(i.extra, 'days')),
      ];
    }));
  }

  @override
  void onClose() {
    for (final s in _subscriptions) {
      s.cancel();
    }
    super.onClose();
  }

  void _bindPlain(String category, RxList<String> target) {
    _subscriptions.add(_db.catalogDao.watchByCategory(category).listen((items) {
      target.value = [for (final i in items) i.label];
    }));
  }

  static int _extraInt(String? extra, String key) {
    if (extra == null) return 0;
    final map = jsonDecode(extra) as Map<String, dynamic>;
    return (map[key] as num?)?.toInt() ?? 0;
  }

  // إضافة اسم (بلا تكرار)
  void addVaccineName(String v) => _addUnique('vaccineName', vaccineNames, v);
  void addTreatmentName(String v) => _addUnique('treatmentName', treatmentNames, v);
  void addDiseaseType(String v) => _addUnique('diseaseType', diseaseTypes, v);
  void addCheckupType(String v) => _addUnique('checkupType', checkupTypes, v);
  void addMedicineReason(String v) => _addUnique('medicineReason', medicineReasons, v);

  void addSchedule(String label) {
    final t = label.trim();
    if (t.isEmpty || schedules.any((s) => s.label == t)) return;
    _db.catalogDao.addItem(
      category: 'schedule',
      value: t,
      label: t,
      extra: jsonEncode({'months': 0}), // مخصّص → تاريخ يدوي
      sortOrder: schedules.length,
    );
  }

  void addInterval(String label) {
    final t = label.trim();
    if (t.isEmpty || intervals.any((i) => i.label == t)) return;
    _db.catalogDao.addItem(
      category: 'interval',
      value: t,
      label: t,
      extra: jsonEncode({'days': 0}), // مخصّص → تاريخ يدوي
      sortOrder: intervals.length,
    );
  }

  ScheduleOption? scheduleByLabel(String label) =>
      schedules.firstWhereOrNull((s) => s.label == label);
  IntervalOption? intervalByLabel(String label) =>
      intervals.firstWhereOrNull((i) => i.label == label);

  void _addUnique(String category, RxList<String> list, String v) {
    final t = v.trim();
    if (t.isEmpty || list.contains(t)) return;
    _db.catalogDao.addItem(category: category, value: t, label: t, sortOrder: list.length);
  }
}
