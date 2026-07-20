import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insighta/models/animal.dart';
import 'package:insighta/modules/dashboard/dashboard_controller.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/web_services/scanner_service.dart';
import 'package:insighta/widgets/animalformstate.dart';

import '../../flock/controllers/flock_controller.dart';

enum EditStep { scanId, form, saved }

class EditOpController extends GetxController {
  final IAnimalRepository _animalRepo = Get.find<IAnimalRepository>();
  final ScannerService _scanner = Get.find<ScannerService>();

  final idCtrl = TextEditingController();
  final idValue = ''.obs;
  final scanning = false.obs;
  final searching = false.obs;
  final notFound = false.obs;

  final step = EditStep.scanId.obs;
  final animal = Rxn<Animal>();
  final form = AnimalFormState();

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
    form.prefill(a); // تعبئة النموذج بالبيانات الحالية
    step.value = EditStep.form;
  }

  Future<void> save() async {
    final a = animal.value;
    if (a == null) return;
    await _animalRepo.update(form.toAnimal(a.id));

    if (Get.isRegistered<DashboardController>()) Get.find<DashboardController>().load();
    if (Get.isRegistered<FlockController>()) Get.find<FlockController>().load();

    step.value = EditStep.saved;
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
  }
}
