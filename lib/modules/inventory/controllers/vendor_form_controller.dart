import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:insighta/models/vendor.dart';
import 'package:insighta/repo.dart/inventory_repository.dart';
import 'inventory_controller.dart';

/// شاشة واحدة تخدم «إضافة مورد» و«تعديل مورد».
/// إن مُرِّر vendorId ← وضع تعديل، وإلا ← وضع إضافة.
class VendorFormController extends GetxController {
  final IInventoryRepository _repo = Get.find<IInventoryRepository>();
  final String? vendorId = Get.arguments as String?;

  final nameCtrl = TextEditingController();
  final specialtyCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final nameVal = ''.obs;

  bool get isEdit => vendorId != null;

  @override
  void onInit() {
    super.onInit();
    nameCtrl.addListener(() => nameVal.value = nameCtrl.text);
    if (isEdit) _loadVendor();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    specialtyCtrl.dispose();
    phoneCtrl.dispose();
    addressCtrl.dispose();
    super.onClose();
  }

  Future<void> _loadVendor() async {
    final vendors = await _repo.getVendors();
    Vendor? v;
    for (final x in vendors) {
      if (x.id == vendorId) v = x;
    }
    if (v != null) {
      nameCtrl.text = v.name;
      specialtyCtrl.text = v.specialty;
      phoneCtrl.text = v.phone;
      addressCtrl.text = v.address;
    }
  }

  bool get canSave => nameVal.value.trim().isNotEmpty;

  Future<void> save() async {
    final v = Vendor(
      id: vendorId ?? 'v${DateTime.now().millisecondsSinceEpoch}',
      name: nameCtrl.text.trim(),
      specialty: specialtyCtrl.text.trim(),
      phone: phoneCtrl.text.trim(),
      address: addressCtrl.text.trim(),
    );
    if (isEdit) {
      await _repo.updateVendor(v);
    } else {
      await _repo.addVendor(v);
    }
    _refresh();
    Get.back();
  }

  Future<void> delete() async {
    if (vendorId == null) return;
    await _repo.deleteVendor(vendorId!);
    _refresh();
    Get.back();
  }

  void _refresh() {
    if (Get.isRegistered<InventoryController>()) {
      Get.find<InventoryController>().load();
    }
  }
}
