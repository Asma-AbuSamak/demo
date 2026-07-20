import 'package:get/get.dart';
import 'package:insighta/models/midicine.dart';
import 'package:insighta/models/medicine_log.dart';
import 'package:insighta/models/vendor.dart';
import 'package:insighta/repo.dart/inventory_repository.dart';

class InventoryIndexController extends GetxController {
  final IInventoryRepository _repo = Get.find<IInventoryRepository>();

  final addLogs = <MedicineLog>[].obs;
  final _meds = <String, Medicine>{};
  final _vendors = <String, Vendor>{};
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    for (final m in await _repo.getMedicines()) {
      _meds[m.id] = m;
    }
    for (final v in await _repo.getVendors()) {
      _vendors[v.id] = v;
    }
    final logs = await _repo.getLogs();
    final adds = logs.where((l) => l.type == MedicineLogType.add).toList();
    adds.sort((a, b) => b.date.compareTo(a.date));
    addLogs.value = adds;
    isLoading.value = false;
  }

  String medName(String id) => _meds[id]?.name ?? id;
  String medUnit(String id) => _meds[id]?.unit ?? '';
  String vendorName(String? id) => id == null ? '' : (_vendors[id]?.name ?? '');
}
