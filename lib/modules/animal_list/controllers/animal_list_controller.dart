import 'package:get/get.dart';

import 'package:insighta/app_routes.dart';
import 'package:insighta/models/animal.dart';
import 'package:insighta/models/med_record.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/repo.dart/medical_repository.dart';
import 'package:insighta/web_services/scanner_service.dart';
import '../../flock/controllers/profile_args.dart';

/// قائمة عامة تعرض الحيوانات حسب حالة تُمرّر إليها (مريض / حامل / ...).
/// نفس الشاشة تخدم أكثر من حالة — بدل تكرار الكود (مبدأ DRY).
class AnimalListController extends GetxController {
  final IAnimalRepository _animalRepo = Get.find<IAnimalRepository>();
  final IMedicalRepository _medRepo = Get.find<IMedicalRepository>();
  final ScannerService _scanner = Get.find<ScannerService>();

  /// الحالة المطلوب عرضها — تأتي من الشاشة السابقة عبر Get.arguments.
  final AnimalStatus status = Get.arguments as AnimalStatus;

  final animals = <Animal>[].obs;
  final latestByAnimal = <String, MedRecord>{}.obs;
  final isLoading = false.obs;
  final scanning = false.obs;

  // عناوين مشتقة من الحالة (بلا شاشات منفصلة)
  String get title {
    switch (status) {
      case AnimalStatus.sick:
        return 'الخرفان المرضى';
      case AnimalStatus.pregnant:
        return 'الخرفان الحوامل';
      case AnimalStatus.healthy:
        return 'الخرفان بصحة جيدة';
    }
  }

  String get backLabel {
    switch (status) {
      case AnimalStatus.sick:
        return 'المرضى';
      case AnimalStatus.pregnant:
        return 'الحوامل';
      case AnimalStatus.healthy:
        return 'الحلال';
    }
  }

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    final all = await _animalRepo.getAll();
    animals.value = all.where((a) => a.status == status).toList();

    final meds = await _medRepo.getMedRecords();
    final map = <String, MedRecord>{};
    for (final r in meds) {
      final cur = map[r.animalId];
      if (cur == null || r.date.compareTo(cur.date) > 0) map[r.animalId] = r;
    }
    latestByAnimal.value = map;
    isLoading.value = false;
  }

  Future<void> openProfile(String id) async {
    await Get.toNamed(Routes.animalProfile,
        arguments: ProfileArgs(id, backLabel: backLabel));
    load(); // عند الرجوع: يختفي مَن تغيّرت حالته
  }

  Future<void> scanAndOpen() async {
    if (animals.isEmpty) return;
    scanning.value = true;
    final id = await _scanner.scan(
      existing: true,
      existingIds: animals.map((a) => a.id).toList(),
    );
    scanning.value = false;
    openProfile(id);
  }
}
