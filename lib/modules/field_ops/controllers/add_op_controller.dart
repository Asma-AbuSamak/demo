import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insighta/modules/dashboard/dashboard_controller.dart';
import 'package:insighta/modules/flock/controllers/flock_controller.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/web_services/scanner_service.dart';
import 'package:insighta/widgets/animalformstate.dart';


enum AddStep { rfid, details, saved }

class AddOpController extends GetxController {
  final IAnimalRepository _animalRepo = Get.find<IAnimalRepository>();
  final ScannerService _scanner = Get.find<ScannerService>();

  final idCtrl = TextEditingController();
  final idValue = ''.obs;
  final scanning = false.obs;

  final step = AddStep.rfid.obs;
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

  bool get canNext => idValue.value.trim().isNotEmpty;

  /// مسح شريحة جديدة (يرجّع معرّفاً جديداً غير موجود).
  Future<void> scan() async {
    scanning.value = true;
    final id = await _scanner.scan(); // جديد RF-xxx
    idCtrl.text = id;
    scanning.value = false;
  }

  void next() {
    if (canNext) step.value = AddStep.details;
  }

  Future<void> save() async {
    final id = idValue.value.trim();
    if (id.isEmpty) return;
    await _animalRepo.add(form.toAnimal(id));

    if (Get.isRegistered<DashboardController>()) Get.find<DashboardController>().load();
    if (Get.isRegistered<FlockController>()) Get.find<FlockController>().load();

    step.value = AddStep.saved;
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
  }
}
