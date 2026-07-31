import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/models/medicine/medicine.dart';
import 'package:insighta/models/medicine_log/medicine_log.dart';
import 'package:insighta/models/vendor/vendor.dart';
import 'package:insighta/repo.dart/inventory_repository.dart';
import 'package:insighta/web_services/catalog_service.dart';
import 'inventory_controller.dart';

/// دُفعة نشِطة: كمية متبقّية + تاريخ انتهائها الخاص.
class MedBatch {
  final int quantity;
  final int expiryUtc;
  final int? priceMinor;
  final String? vendorId;
  MedBatch(this.quantity, this.expiryUtc, this.priceMinor, this.vendorId);
}

class MedicineDetailController extends GetxController {
  final IInventoryRepository _repo = Get.find<IInventoryRepository>();
  final CatalogService catalog = Get.find<CatalogService>();
  final String medicineId = Get.arguments as String;

  final medicine = Rxn<Medicine>();
  final logs = <MedicineLog>[].obs;
  final vendors = <Vendor>[].obs;
  final isLoading = false.obs;

  // نموذج تعديل الكمية
  final qtyCtrl = TextEditingController();
  final note = ''.obs;
  final priceCtrl = TextEditingController();
  final batchExpiry = Rxn<int>();
  final selectedVendor = ''.obs;
  final qtyVal = ''.obs;

  @override
  void onInit() {
    super.onInit();
    qtyCtrl.addListener(() => qtyVal.value = qtyCtrl.text);
    load();
  }

  @override
  void onClose() {
    qtyCtrl.dispose();
    priceCtrl.dispose();
    super.onClose();
  }

  Future<void> load() async {
    isLoading.value = true;
    final meds = await _repo.getMedicines();
    Medicine? m;
    for (final x in meds) {
      if (x.id == medicineId) m = x;
    }
    medicine.value = m;
    final l = await _repo.getLogsFor(medicineId);
    l.sort((a, b) => b.dateUtc.compareTo(a.dateUtc));
    logs.value = l;
    vendors.value = await _repo.getVendors();
    isLoading.value = false;
  }

  bool get isExpired =>
      medicine.value != null && AppDate.isExpiredEpoch(medicine.value!.expiryDateUtc);
  bool get canAdjust => int.tryParse(qtyVal.value.trim()) != null;

  String vendorName(String? id) {
    if (id == null) return '';
    for (final v in vendors) {
      if (v.id == id) return v.name;
    }
    return '';
  }

  /// ★ حساب الدُفعات النشِطة بمنطق FEFO (الأقرب انتهاءً يُستهلك أولاً).
  List<MedBatch> get batches {
    final med = medicine.value;
    if (med == null) return [];
    final adds = logs.where((l) => l.type == MedicineLogType.add).toList();
    if (adds.isEmpty) {
      // دواء بلا سجل دُفعات → دُفعة واحدة ضمنية بكامل الكمية
      return med.quantity > 0
          ? [MedBatch(med.quantity, med.expiryDateUtc, null, null)]
          : [];
    }
    // رتّب الإضافات حسب تاريخ الانتهاء تصاعدياً (الأقرب أولاً)
    adds.sort((a, b) => (a.batchExpiryDateUtc ?? med.expiryDateUtc)
        .compareTo(b.batchExpiryDateUtc ?? med.expiryDateUtc));
    int removed = logs
        .where((l) => l.type == MedicineLogType.remove)
        .fold(0, (s, l) => s + l.quantity);

    final result = <MedBatch>[];
    for (final a in adds) {
      var remaining = a.quantity;
      if (removed > 0) {
        final take = remaining < removed ? remaining : removed;
        remaining -= take;
        removed -= take;
      }
      if (remaining > 0) {
        result.add(MedBatch(remaining, a.batchExpiryDateUtc ?? med.expiryDateUtc,
            a.purchasePriceMinor, a.vendorId));
      }
    }
    return result;
  }

  /// أقرب تاريخ انتهاء بين الدُفعات النشِطة (يمثّل صلاحية الدواء الفعلية).
  int get effectiveExpiry {
    final b = batches;
    return b.isEmpty ? (medicine.value?.expiryDateUtc ?? 0) : b.first.expiryUtc;
  }

  Future<void> addQuantity() => _adjust(MedicineLogType.add);
  Future<void> removeQuantity() => _adjust(MedicineLogType.remove);

  Future<void> _adjust(MedicineLogType type) async {
    final amount = int.tryParse(qtyVal.value.trim());
    final med = medicine.value;
    if (amount == null || amount <= 0 || med == null) return;

    String? vId;
    for (final v in vendors) {
      if (v.name == selectedVendor.value) vId = v.id;
    }

    final now = AppDate.nowEpoch();
    await _repo.addLog(MedicineLog(
      id: 'ml${DateTime.now().millisecondsSinceEpoch}',
      medicineId: med.id,
      dateUtc: AppDate.todayEpoch(),
      type: type,
      quantity: amount,
      note: note.value.trim().isEmpty
          ? (type == MedicineLogType.add ? 'إضافة للمخزن' : 'سحب من المخزن')
          : note.value.trim(),
      vendorId: type == MedicineLogType.add ? vId : null,
      purchasePriceMinor: type == MedicineLogType.add && double.tryParse(priceCtrl.text.trim()) != null
          ? (double.parse(priceCtrl.text.trim()) * 100).round()
          : null,
      batchExpiryDateUtc:
          type == MedicineLogType.add ? batchExpiry.value : null,
      createdAtUtc: now,
      updatedAtUtc: now,
    ));

    final newQty = type == MedicineLogType.add
        ? med.quantity + amount
        : (med.quantity - amount).clamp(0, 1 << 30);
    await _repo.updateMedicine(med.copyWith(quantity: newQty));
    await load();

    // مزامنة صلاحية الدواء = أقرب دُفعة نشِطة (FEFO)
    final eff = effectiveExpiry;
    if (eff != 0 && eff != medicine.value!.expiryDateUtc) {
      await _repo.updateMedicine(medicine.value!.copyWith(expiryDateUtc: eff));
      await load();
    }

    _resetForm();
    if (Get.isRegistered<InventoryController>()) Get.find<InventoryController>().load();
  }

  Future<void> deleteMedicine() async {
    await _repo.deleteMedicine(medicineId);
    if (Get.isRegistered<InventoryController>()) Get.find<InventoryController>().load();
    Get.back();
  }

  void _resetForm() {
    qtyCtrl.clear();
    note.value = '';
    priceCtrl.clear();
    batchExpiry.value = null;
    selectedVendor.value = '';
  }
}
