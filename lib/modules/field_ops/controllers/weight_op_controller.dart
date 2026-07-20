import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insighta/models/animal.dart';
import 'package:insighta/models/weight_record.dart';
import 'package:insighta/modules/dashboard/dashboard_controller.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/repo.dart/medical_repository.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/web_services/scanner_service.dart';
import '../../flock/controllers/flock_controller.dart';

/// خطوات عملية تسجيل الوزن (نفس نمط كل العمليات الميدانية).
enum WeightStep { scanId, form, saved }

class WeightOpController extends GetxController {
  final IAnimalRepository _animalRepo = Get.find<IAnimalRepository>();
  final IMedicalRepository _medRepo = Get.find<IMedicalRepository>();
  final ScannerService _scanner = Get.find<ScannerService>();

  final idCtrl = TextEditingController();
  final idValue = ''.obs;
  final weightValue = ''.obs;

  final step = WeightStep.scanId.obs;
  final animal = Rxn<Animal>();
  final lastWeights = <WeightRecord>[].obs;
  final scanning = false.obs;
  final notFound = false.obs;
  final searching = false.obs;

  @override
  void onInit() {
    super.onInit();
    idCtrl.addListener(() => idValue.value = idCtrl.text);
  }

  @override
  void onClose() {
    idCtrl.dispose();
    super.onClose();
  }

  bool get canSearch => idValue.value.trim().isNotEmpty && !searching.value;
  bool get canSave => double.tryParse(weightValue.value.trim()) != null;

  /// الماسح الوهمي: يملأ الحقل بمعرّف خروف موجود (ثم يضغط المزارع "بحث").
  Future<void> scan() async {
    scanning.value = true;
    final all = await _animalRepo.getAll();
    final id = await _scanner.scan(
      existing: true,
      existingIds: all.map((a) => a.id).toList(),
    );
    idCtrl.text = id; // سيحدّث idValue عبر listener
    scanning.value = false;
  }

  /// الخطوة 1 → 2: يبحث عن الحيوان بالـ ID.
  Future<void> search() async {
    notFound.value = false;
    searching.value = true;
    final a = await _animalRepo.getById(idValue.value.trim());
    searching.value = false;
    if (a == null) {
      notFound.value = true;
      return;
    }
    animal.value = a;
    final w = await _medRepo.getWeightsFor(a.id);
    w.sort((x, y) => y.date.compareTo(x.date)); // الأحدث أولاً
    lastWeights.value = w.take(3).toList();
    step.value = WeightStep.form;
  }

  /// الخطوة 2 → 3: يحفظ الوزن الجديد محلياً (Mock).
  Future<void> save() async {
    final a = animal.value;
    final w = double.tryParse(weightValue.value.trim());
    if (a == null || w == null) return;

    await _medRepo.addWeight(WeightRecord(
      id: 'w${DateTime.now().millisecondsSinceEpoch}',
      animalId: a.id,
      date: AppDate.todayIso(),
      weight: w,
      synced: false,
    ));
    await _animalRepo.update(a.copyWith(weight: w));

    // تحديث الشاشات المفتوحة على نفس البيانات
    if (Get.isRegistered<DashboardController>()) Get.find<DashboardController>().load();
    if (Get.isRegistered<FlockController>()) Get.find<FlockController>().load();

    step.value = WeightStep.saved;
    await Future.delayed(const Duration(seconds: 2));
    Get.back(); // يرجع لقائمة العمليات
  }
}
