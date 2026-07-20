import 'package:get/get.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/models/midicine.dart';
import 'package:insighta/models/vendor.dart';
import 'package:insighta/repo.dart/inventory_repository.dart';

class InventoryController extends GetxController {
  final IInventoryRepository _repo = Get.find<IInventoryRepository>();

  final medicines = <Medicine>[].obs;
  final vendors = <Vendor>[].obs;
  final tab = 0.obs; // 0 = أدوية, 1 = موردون
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    medicines.value = await _repo.getMedicines();
    vendors.value = await _repo.getVendors();
    isLoading.value = false;
  }

  bool isExpired(Medicine m) => AppDate.isExpired(m.expiryDate);
  bool isSoon(Medicine m) =>
      !AppDate.isExpired(m.expiryDate) && AppDate.isExpiringSoon(m.expiryDate);

  int get expiredCount => medicines.where(isExpired).length;
  int get soonCount => medicines.where(isSoon).length;
}
