import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/models/medicine/medicine.dart';
import 'package:insighta/models/medicine_log/medicine_log.dart';
import 'package:insighta/repo.dart/inventory_repository.dart';
import 'inventory_controller.dart';

class MedicineFormController extends GetxController {
  final IInventoryRepository _repo = Get.find<IInventoryRepository>();

  final nameCtrl = TextEditingController();
  final qtyCtrl = TextEditingController();
  final nameVal = ''.obs;
  final qtyVal = ''.obs;
  final unit = 'زجاجة'.obs;
  final expiry = Rxn<int>();

  @override
  void onInit() {
    super.onInit();
    nameCtrl.addListener(() => nameVal.value = nameCtrl.text);
    qtyCtrl.addListener(() => qtyVal.value = qtyCtrl.text);
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    qtyCtrl.dispose();
    super.onClose();
  }

  bool get canSave =>
      nameVal.value.trim().isNotEmpty &&
      int.tryParse(qtyVal.value.trim()) != null &&
      expiry.value != null;

  Future<void> save() async {
    final qty = int.tryParse(qtyVal.value.trim()) ?? 0;
    final id = 'md${DateTime.now().millisecondsSinceEpoch}';
    final now = AppDate.nowEpoch();
    await _repo.addMedicine(Medicine(
      id: id,
      name: nameCtrl.text.trim(),
      quantity: qty,
      unit: unit.value,
      expiryDateUtc: expiry.value!,
      createdAtUtc: now,
      updatedAtUtc: now,
    ));
    // رصيد افتتاحي كأول دُفعة
    await _repo.addLog(MedicineLog(
      id: 'ml${DateTime.now().millisecondsSinceEpoch}',
      medicineId: id,
      dateUtc: AppDate.todayEpoch(),
      type: MedicineLogType.add,
      quantity: qty,
      note: 'رصيد افتتاحي',
      batchExpiryDateUtc: expiry.value,
      createdAtUtc: now,
      updatedAtUtc: now,
    ));
    if (Get.isRegistered<InventoryController>()) Get.find<InventoryController>().load();
    Get.back();
  }
}
