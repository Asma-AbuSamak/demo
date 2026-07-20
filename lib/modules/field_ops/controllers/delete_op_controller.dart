import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insighta/app_constants.dart';
import 'package:insighta/models/animal.dart';
import 'package:insighta/models/death_record.dart';
import 'package:insighta/models/sale_record.dart';
import 'package:insighta/modules/dashboard/dashboard_controller.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/repo.dart/records_repository.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/web_services/scanner_service.dart';

import '../../flock/controllers/flock_controller.dart';

enum DeleteStep { scanId, form, saved }
enum DeleteReason { death, sale }

class DeleteOpController extends GetxController {
  final IAnimalRepository _animalRepo = Get.find<IAnimalRepository>();
  final IRecordsRepository _recordsRepo = Get.find<IRecordsRepository>();
  final ScannerService _scanner = Get.find<ScannerService>();

  final idCtrl = TextEditingController();
  final idValue = ''.obs;
  final scanning = false.obs;
  final searching = false.obs;
  final notFound = false.obs;

  final step = DeleteStep.scanId.obs;
  final animal = Rxn<Animal>();

  final reason = DeleteReason.death.obs;
  final deathCause = ''.obs;
  final salePrice = ''.obs;
  final notes = ''.obs;
  final savedMsg = ''.obs;

  final deathCauseOptions = <String>[...AppConstants.deathCausesDefault].obs;

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

  void setReason(DeleteReason r) => reason.value = r;
  void addDeathCause(String v) {
    if (!deathCauseOptions.contains(v)) deathCauseOptions.add(v);
  }

  Future<void> scan() async {
    scanning.value = true;
    final all = await _animalRepo.getAll();
    final id = await _scanner.scan(
        existing: true, existingIds: all.map((a) => a.id).toList());
    idCtrl.text = id;
    scanning.value = false;
  }

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
    step.value = DeleteStep.form;
  }

  Future<void> confirm() async {
    final a = animal.value;
    if (a == null) return;

    // 1) حذف الحيوان من قائمة الحلال
    await _animalRepo.delete(a.id);

    // 2) أرشفة السبب (وفاة أو بيع)
    if (reason.value == DeleteReason.death) {
      await _recordsRepo.addDeath(DeathRecord(
        id: 'd${DateTime.now().millisecondsSinceEpoch}',
        animalId: a.id,
        date: AppDate.todayIso(),
        cause: deathCause.value.trim().isEmpty ? 'مجهول السبب' : deathCause.value.trim(),
        breed: a.breed,
        gender: a.gender,
      ));
      savedMsg.value = 'تم تسجيل وفاة الخروف ${a.id}';
    } else {
      final price = double.tryParse(salePrice.value.trim()) ?? 0;
      await _recordsRepo.addSale(SaleRecord(
        id: 's${DateTime.now().millisecondsSinceEpoch}',
        animalId: a.id,
        date: AppDate.todayIso(),
        salePrice: price,
        breed: a.breed,
        gender: a.gender,
        purchasePrice:
            a.purchasePrice != null ? double.tryParse(a.purchasePrice!) : null,
      ));
      savedMsg.value = 'تم تسجيل بيع الخروف ${a.id} بسعر ${salePrice.value} ريال';
    }

    // 3) تحديث الشاشات (نقص العدد + إحصائيات الوفيات/البيع)
    if (Get.isRegistered<DashboardController>()) Get.find<DashboardController>().load();
    if (Get.isRegistered<FlockController>()) Get.find<FlockController>().load();

    step.value = DeleteStep.saved;
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
  }
}
